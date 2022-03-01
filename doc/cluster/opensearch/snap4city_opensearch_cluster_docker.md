# Clustering Opensearch using Snap4City Docker image

**Aim**: obtain an Opensearch cluster when running Opensearch instances as Docker images on different hosts using `docker-compose` with default networking.

## Scenario

Suppose a 3-node cluster scenario where we have 3 hosts:
* **opensearch-n1**: 192.168.1.60
* **opensearch-n2**: 192.168.1.61
* **opensearch-n3**: 192.168.1.62

The **opensearch-n1** host will run the whole Snap4City application stack while other hosts will only run an Opensearch instance.

## Outline

* Get snap4city-docker repository
* Edit docker-compose.yml
* Edit opensearch.yml
* Perform setup
* Copy Opensearch part on the other hosts
* Generate certificates for the other hosts
* Reduced docker-compose.yml on hosts
* Start Opensearch containers
* Verify cluster state

## Get snap4city-docker repository
On the **opensearch-n1** host:
```
git clone https://github.com/disit/snap4city-docker
```

## Edit docker-compose.yml

Edit `snap4city-docker/docker-compose.yml`.  
The configuration of the `opensearch-n1` service inside the compose file becomes:

```
opensearch-n1:
  image: opensearchproject/opensearch:1.2.3
  environment:
#      - discovery.type=single-node
    - cluster.name=snap4city-opensearch-cluster
    - node.name=opensearch-n1
    - discovery.seed_hosts=opensearch-n1,opensearch-n2,opensearch-n3
    - DISABLE_INSTALL_DEMO_CONFIG=true
    - network.host=0.0.0.0
    - network.publish_host=192.168.1.60
  hostname: opensearch-n1
  ports:
    - "9200:9200"
    - "9300:9300"
  extra_hosts:
    - opensearch-n1:192.168.1.60
    - opensearch-n2:192.168.1.61
    - opensearch-n3:192.168.1.62
  depends_on:
    - keycloak
    - ldap-server
  volumes:
    - opensearch-data:/usr/share/opensearch/data
    - ./opensearch-conf/root-ca.pem:/usr/share/opensearch/config/root-ca.pem
    - ./opensearch-conf/node1.pem:/usr/share/opensearch/config/esnode.pem
    - ./opensearch-conf/node1-key.pem:/usr/share/opensearch/config/esnode-key.pem
    - ./opensearch-conf/admin.pem:/usr/share/opensearch/config/admin.pem
    - ./opensearch-conf/admin-key.pem:/usr/share/opensearch/config/admin-key.pem
    - ./opensearch-conf/opensearch.yml:/usr/share/opensearch/config/opensearch.yml
    - ./opensearch-conf/security-config.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfi>
    - ./opensearch-conf/internal_users.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig>
    - ./opensearch-conf/roles_mapping.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig/>
    - ./opensearch-conf/tenants.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig/tenant>
    - ./opensearch-conf/roles.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig/roles.yml
    - ./opensearch-conf/action_groups.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig/>
  restart: unless-stopped
  logging:
    driver: "json-file"
    options:
      max-size: "${S4C_LOG_MAX_SIZE:-100m}"
      max-file: "${S4C_LOG_MAX_FILE:-10}"
```

In particular:

#### Hostname
 * `hostname:opensearch-n1` gives an explicit hostname to the container.

#### Env
* Be sure to comment out/remove the `discovery.type=single-node` in the `environment` setting.
* `cluster.name=snap4city-opensearch-cluster` sets the cluster name.
* `node.name=opensearch-n1` sets the node name.
* `discovery.seed_hosts=opensearch-n1,opensearch-n2,opensearch-n3` sets all 3 nodes as discovery hosts.
* `network.publish_host=192.168.1.60` sets the advertised ip for the node. This is the ip that the node will communicate to the other Opensearch hosts. (**USE** the ip of the machine on which the container will run).

#### Ports
* `9200:9200` maps the `9200` standard Opensearch port.
* `9300:9300` maps the `9300` port for inter-cluster communication.

#### Extra Hosts
The `extra_hosts` options specifies additional entries in the `/etc/hosts` file inside the containers mapping the hostnames to the host ips:
```
192.168.1.60    opensearch-n1
192.168.1.61    opensearch-n2
192.168.1.62    opensearch-n3
```

## Edit opensearch.yml

The `opensearch.yml` file inside `snap4city-docker/DataCity-Small/opensearch-conf` needs to be updated in order to allow the other hosts to join the cluster.

We need to add the following configuration:
```
plugins.security.nodes_dn:                                                                                
  - "CN=opensearch-n1,O=SNAP4,L=Florence,ST=Toscana,C=IT"                                                     
  - "CN=opensearch-n2,O=SNAP4,L=Florence,ST=Toscana,C=IT"
  - "CN=opensearch-n3,O=SNAP4,L=Florence,ST=Toscana,C=IT"
```

These are the subjects of the nodes certificates.

## Snap4City setup
Perform the snap4city setup in order to generate the truststore in `snap4city-docker/DataCity-Small`.

```
cd snap4city-docker/DataCity-Small

# setup directories write permissions and sets vm.max_map_count=262144 for elasticsearch
# consider adding this option into /etc/sysctl.conf otherwise have to be set after each reboot
./setup.sh
```

Now **opensearch-n1** host should be ready to run the snap4city stack including an Opensearch instance.

By running, inside the `snap4city-docker` folder:
```
sudo docker-compose up -d
```
a 1-node Opensearch cluster should be created in the snap4city application stack.

## Copy Opensearch on hosts
The **opensearch-n1** host is ready to run the Snap4City application stack including an Opensearch instance.

To run Opensearch on **opensearch-n2** and **opensearch-n3** hosts we need to copy the Opensearch part and use a reduced docker-compose.yml file specifying only the Opensearch service.

On the **opensearch-n2** and **opensearch-n3** hosts:
```
mkdir snap4city-opensearch
```

Copy the folder `snap4city-docker/DataCity-Small/opensearch-conf` from **opensearch-n1** to `snap4city-opensearch` on **opensearch-n2** and **opensearch-n3**.

The folder layout on **opensearch-n2** and **opensearch-n3** should looks like:
```
snap4city-opensearch/
└── opensearch-conf
    ├── action_groups.yml
    ├── admin-key.pem
    ├── admin.pem
    ├── client-key.pem
    ├── client.pem
    ├── gen-certs.sh
    ├── internal_users.yml
    ├── node1-key.pem
    ├── node1.pem
    ├── opensearch_dashboards.yml
    ├── opensearch-securityupdate.sh
    ├── opensearch.yml
    ├── roles_mapping.yml
    ├── roles.yml
    ├── root-ca-key.pem
    ├── root-ca.pem
    ├── root-ca.srl
    ├── security-config.yml
    ├── tenants.yml
    └── trust-store.p12
```

## Generate certificates for the other hosts
On the **opensearch-n1** host the certificate has been generated during the setup operations (`node1-key.pem` and `node1.pem` files).

For the **opensearch-n2** and **opensearch-n3** hosts we need to generate the certificates separately.

First move inside the directory `opensearch-conf`:
```
cd snap4city-opensearch/opensearch-conf
```

Then use this script to generate the certificate for such hosts (the following example assume the certificate generation for the **opensearch-n2** host):
```
#!/bin/sh
# Root CA
C=IT
ST=Toscana
L=Florence
O=SNAP4
OU=
CN=opensearch-n2

# Node cert
echo
echo generate node cert
openssl genrsa -out node-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in node-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out node-key.pem
openssl req -new -key node-key.pem -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$CN" -out node.csr
openssl x509 -req -in node.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out node.pem -days 3650

chmod a+r *-key.pem

# Cleanup
rm node-key-temp.pem
rm node.csr
```

for the **opensearch-n3** host use the same script, but change the `CN` parameter:
```
CN=opensearch-n2
```
to
```
CN=opensearch-n3
```

After the script execution, the files:
* `node-key.pem`
* `node.pem`

should be present inside the `opensearch-conf` directory.

The `node1-key.pem` and `node1.pem` files can be optionally removed from the `opensearch-conf` directory on **opensearch-n2** and **opensearch-n3** hosts because they are relative to the **opensearch-n1** node.

## Reduced docker-compose.yml on hosts

On **opensearch-n2** and **opensearch-n3** create the `snap4city-opensearch/docker-compose.yml` file containing the definition for the Opensearch service only and changing the configurations according to the hostnames/ips.

For example on **opensearch-n2**:
```
version: "3"
services:
  opensearch-n2:
    image: opensearchproject/opensearch:1.2.3
    environment:
      - cluster.name=snap4city-opensearch-cluster
      - node.name=opensearch-n2
      - discovery.seed_hosts=opensearch-n1,opensearch-n2,opensearch-n3
      - cluster.initial_master_nodes=opensearch-n1,opensearch-n2,opensearch-n3
#        - discovery.type=single-node
      - DISABLE_INSTALL_DEMO_CONFIG=true
      - network.host=0.0.0.0
      - network.publish_host=192.168.1.61
    hostname: opensearch-n2
    ports:
      - "9200:9200"
      - "9300:9300"
    extra_hosts:
      - dashboard:192.168.1.60
      - ldap-server:192.168.1.60
      - opensearch-n1:192.168.1.60
      - opensearch-n2:192.168.1.61
      - opensearch-n3:192.168.1.62
    volumes:
      - opensearch-data:/usr/share/opensearch/data
      - ./opensearch-conf/root-ca.pem:/usr/share/opensearch/config/root-ca.pem
      - ./opensearch-conf/node.pem:/usr/share/opensearch/config/esnode.pem
      - ./opensearch-conf/node-key.pem:/usr/share/opensearch/config/esnode-key.pem
      - ./opensearch-conf/admin.pem:/usr/share/opensearch/config/admin.pem
      - ./opensearch-conf/admin-key.pem:/usr/share/opensearch/config/admin-key.pem
      - ./opensearch-conf/opensearch.yml:/usr/share/opensearch/config/opensearch.yml
      - ./opensearch-conf/security-config.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig/config.yml
      - ./opensearch-conf/internal_users.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig/internal_us>
      - ./opensearch-conf/roles_mapping.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig/roles_mappin>
      - ./opensearch-conf/tenants.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig/tenants.yml
      - ./opensearch-conf/roles.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig/roles.yml
      - ./opensearch-conf/action_groups.yml:/usr/share/opensearch/plugins/opensearch-security/securityconfig/action_group>
    restart: unless-stopped
    logging:
      driver: "json-file"
      options:
        max-size: "${S4C_LOG_MAX_SIZE:-100m}"
        max-file: "${S4C_LOG_MAX_FILE:-10}"

volumes:
  opensearch-data:
```

In particular:

#### Hostname
* `hostname:opensearch-n2` sets the hostname.

#### Env
* `node.name:opensearch-n2` change the node name.
* `network.publish_host=192.168.1.61` change the advertised node ip.

#### Extra hosts
We need to map 2 additional hostnames to reach the needed services on the node which runs the full Snap4City application stack:
* `dashboard:192.168.1.60`
* `ldap-server:192.168.1.60`

#### Volumes
In the `volumes` section of the opensearch service use the new certificates:
```
- ./opensearch-conf/node.pem:/usr/share/opensearch/config/esnode.pem
- ./opensearch-conf/node-key.pem:/usr/share/opensearch/config/esnode-key.pem
```
(**NOTE**: the files used are `node-key.pem` and `node.pem` instead of `node1-key.pem` and `node1.pem`)

## Start Opensearch containers
If the Snap4City stack is not already running on **opensearch-n1**:
```
cd snap4city-docker
sudo docker-compose up -d
```

On **opensearch-n2** and **opensearch-n3** hosts:
```
cd snap4city-opensearch
sudo docker-compose up -d
```
When all containers are up and running the Opensearch instances should form a 3-node cluster.

## Verify cluster state

To verify the cluster state you can access the Snap4City dashboard through:   http://dashboard/dashboardSmartCity

and log in as **userrootadmin** (the credentials can be found at https://www.snap4city.org/drupal/node/487).

Then, using the left side menu, access `Kibana` -> `Management` -> `Dev Tools`.

From here you can make authenticated requests to the Opensearch endpoints, alternatively you can use CURL from command line to perform the requests but you need to specify the username and the password for every request.

(**NOTE**: The following example requests have been made on a cluster with two nodes **opensearch-n1** and **opensearch-n2**)

#### Cluster Health
Dev Tools request:
```
GET _cluster/health?v
```

equivalent CURL request:
```
curl -XGET https://dashboard:9200/_cluster/health -u 'admin:admin' --insecure
```

example response:
```
{
  "cluster_name" : "snap4city-opensearch-cluster",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 2,
  "number_of_data_nodes" : 2,
  "discovered_master" : true,
  "active_primary_shards" : 20,
  "active_shards" : 40,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 100.0
}
```

The cluster status should be **green**.  
There should be 0 unassigned shards.

The official documentation for this endpoint can be found at:  
https://opensearch.org/docs/latest/opensearch/rest-api/cluster-health/

#### Cluster nodes
Dev tools request:
```
GET _cat/nodes?v
```

Equivalent CURL request:
```
curl -XGET https://dashboard:9200/_cat/nodes?v -u 'admin:admin' --insecure
```

Example response:
```
ip           heap.percent ram.percent cpu load_1m load_5m load_15m node.role master name
192.168.1.61           30          62   1    0.00    0.02     0.02 dimr      -      opensearch-n2
192.168.1.60           22          97   5    0.32    0.20     0.27 dimr      *      opensearch-n1
```

#### Shards

Verify the shards for a particular index (**snap4-iot-organization** in this example).

Dev tools request:
```
GET _cat/shards/snap4-iot-organization?v
```

Equivalent CURL request:
```
curl -XGET https://dashboard:9200/_cat/shards/snap4-iot-organization?v -u 'admin:admin' --insecure
```

Example response:
```
index                  shard prirep state   docs   store ip           node
snap4-iot-organization 3     r      STARTED   17  46.7kb 192.168.1.61 opensearch-n2
snap4-iot-organization 3     p      STARTED   17  46.7kb 192.168.1.60 opensearch-n1
snap4-iot-organization 5     r      STARTED   14 158.9kb 192.168.1.61 opensearch-n2
snap4-iot-organization 5     p      STARTED   14 158.9kb 192.168.1.60 opensearch-n1
snap4-iot-organization 4     r      STARTED   19   147kb 192.168.1.61 opensearch-n2
snap4-iot-organization 4     p      STARTED   19   147kb 192.168.1.60 opensearch-n1
snap4-iot-organization 1     r      STARTED   22 138.6kb 192.168.1.61 opensearch-n2
snap4-iot-organization 1     p      STARTED   22 138.6kb 192.168.1.60 opensearch-n1
snap4-iot-organization 2     r      STARTED   16  60.3kb 192.168.1.61 opensearch-n2
snap4-iot-organization 2     p      STARTED   16  60.3kb 192.168.1.60 opensearch-n1
snap4-iot-organization 0     r      STARTED   23 154.4kb 192.168.1.61 opensearch-n2
snap4-iot-organization 0     p      STARTED   23 154.4kb 192.168.1.60 opensearch-n1
```

#### Unassigned shards
If there are unassigned shards, you can make a request to explain why they can't be allocated to a node.

Dev tools request:
```
GET _cluster/allocation/explain
```
Equivalent CURL request:
```
curl -XGET http://dashboard:9200/_cluster/allocation/exaplain -u 'admin:admin' --insecure
```

Endpoint documentation:  
https://opensearch.org/docs/latest/opensearch/rest-api/cluster-allocation/

### OpenSearch REST API Reference

For every REST endpoint available refer to the official OpenSearch documentation:  
https://opensearch.org/docs/latest/opensearch/rest-api/index/
