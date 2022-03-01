# Elasticsearch to Opensearch re-index Guide

**Scope**: re-index documents from an Elasticsearch index to an Opensearch index.

Tested with versions:
* **Elasticsearch**: `7.6.1`
* **Opensearch**: `1.2.3`

In this example we assume:

* An **Elasticsearch** service on a single host located at `192.168.1.50` using standard port `9200`.

* An **Opensearch** instance running on a docker container as part of the [Snap4City-docker](https://github.com/disit/snap4city-docker) infrastructure on host `192.168.1.60` using standard port `9200`.

This can be done by using the Opensearch [reindex](https://opensearch.org/docs/latest/opensearch/reindex-data) endpoint.

## Outline
* Whitelist Elasticsearch in Opensearch
* Create the new index in Opensearch
* Reindex
* Post reindex ops

## Whitelist Elasticsearch in Opensearch
In order to perform the remote reindexing the remote hosts needs to be explicitly allowed using the `reindex.remote.whitelist` property in the `opensearch.yml` file.

When Opensearch runs as a docker container as in the Snap4City-docker case, this property can be set in the `snap4city-docker/DataCity-Small/docker-compose.yml` file by using the environment settings.  
1. Edit the `opensearch-n1` service inside the compose file:
```
opensearch-n1:
  ...
  env:
     ...
     reindex.remote.whitelist: 192.168.1.50:9200
  ...
```  
If the reindex is done from more nodes use a comma-separated list: `<host1>:<port1>,<host2>:<port2>,...`  
If the source **Elasticsearch** uses SSL there are other [settings](https://www.elastic.co/guide/en/elasticsearch/reference/8.0/docs-reindex.html#reindex-ssl) (the documentation is from Elasticsearch 8.0 but applies to the Opensearch version tested in this guide) to configure the `https` connection.

2. Restart and recreate the Opensearch container to apply the changes:
```
sudo docker-compose stop opensearch-n1
sudo docker-compose rm -f -v opensearch-n1
sudo docker-compose create --force-recreate opensearch-n1
sudo docker-compose start opensearch-n1
```

**NOTE**: if Opensearch is clustered update the compose file and recreate/restart the containers on every node.

## Create the new index in Opensearch

Access the Snap4City dashboard through: http://dashboard/dashboardSmartCity  
and log in as **userrootadmin** (the credentials can be found at https://www.snap4city.org/drupal/node/487).

Then, using the left side menu, access `Kibana` -> `Management` -> Dev `Tools`.

From here you can make authenticated requests to Opensearch or alternatively use curl from command line.

1. Create the new index on Opensearch:
```
PUT destination-index
```
equivalent CURL command:
```
curl -X PUT https://dashboard:9200/destination-index -i 'admin:admin' --insecure
```

2. Unset the `refresh_interval` and the `number_of_replicas` on the new index:
```
PUT destination-index/_settings
{
    "index":{
      "refresh_interval":"-1"
      "number_of_replicas":0,
    }
}
```
equivalent CURL command:
```
curl -X PUT https://dashboard:9200/destination-index/_settings \
-H "Content-Type: application/json" \
-d '{ "index":{ "refresh_interval":"-1" , "number_of_replicas":"0" } }' \
-u 'admin:admin' --insecure
```

## Reindex

To start the reindexing use:
```
POST _reindex
{
  "source": {
    "index": "old-index",
    "remote": {
      "host": "http://192.168.1.50:9200",
    }
  },
  "dest": {
    "index": "destination-index"
  }
}
```
equivalent CURL command:
```
curl -X POST https://dashboard:9200/_reindex \
-H "Content: application/json" \
-d '{ "source" : { "index":"old-index" , "remote" : { "host":"http://192.168.1.50:9200" } } , "dest" : { "index":"destination-index" } }' \
-u 'admin:admin' --insecure
```

if the source Elasticsearch is protected by basic auth you can supply a username and a password inside the `remote` object:
```
"remote":{
  "host":"http://192.168.1.50:9200",
  "USERNAME":"YOUR_USERNAME",
  "PASSWORD":"YOUR_PASSWORD"
}
```

when the process finishes Opensearch will send a response, for example:
```
{
  "took" : 180,
  "timed_out" : false,
  "total" : 60,
  "updated" : 0,
  "created" : 60,
  "deleted" : 0,
  "batches" : 1,
  "version_conflicts" : 0,
  "noops" : 0,
  "retries" : {
    "bulk" : 0,
    "search" : 0
  },
  "throttled_millis" : 0,
  "requests_per_second" : -1.0,
  "throttled_until_millis" : 0,
  "failures" : [ ]
}
```

### Do not wait for completion
If you don't want to wait for the completion you can specify `wait_for_completion=false`:
```
POST _reindex?wait_for_completion=false
{
  "source": {
    "index": "old-index",
    "remote": {
      "host": "http://192.168.1.50:9200"
    }
  },
  "dest": {
    "index": "destination-index"
  }
}
```
equivalent CURL command:
```
curl -X POST https://dashboard:9200/_reindex?wait_for_completion=false \
-H "Content: application/json" \
-d '{ "source" : { "index":"old-index" , "remote" : { "host":"http://192.168.1.50:9200" } } , "dest" : { "index":"destination-index" } }' \
-u 'admin:admin' --insecure
```

Opensearch will respond immediately with a task ID:
```
{
  "task" : "dKhcbPvRQVGIK4ey1DzzIw:16246"
}
```

that you can use to monitor the reindexing processing through the [task API](https://www.elastic.co/guide/en/elasticsearch/reference/8.0/tasks.html):
```
GET _tasks/dKhcbPvRQVGIK4ey1DzzIw:16246
```
equivalent CURL command:
```
curl -X GET https://dashboard:9200/_tasks/dKhcbPvRQVGIK4ey1DzzIw:16246 \
-u 'admin:admin' --insecure
```

the response when the task is finished should looks like:
```
{
  "completed" : true,
  "task" : {
    "node" : "dKhcbPvRQVGIK4ey1DzzIw",
    "id" : 16246,
    "type" : "transport",
    "action" : "indices:data/write/reindex",
    "status" : {
      "total" : 60,
      "updated" : 0,
      "created" : 60,
      "deleted" : 0,
      "batches" : 1,
      "version_conflicts" : 0,
      "noops" : 0,
      "retries" : {
        "bulk" : 0,
        "search" : 0
      },
      "throttled_millis" : 0,
      "requests_per_second" : -1.0,
      "throttled_until_millis" : 0
    },
    "description" : """reindex from [host=192.168.1.50 port=9200 query={
  "match_all" : {
    "boost" : 1.0
  }
}][old-index] to [destination-index][_doc]""",
    "start_time_in_millis" : 1644534654895,
    "running_time_in_nanos" : 139859931,
    "cancellable" : true,
    "headers" : { }
  },
  "response" : {
    "took" : 136,
    "timed_out" : false,
    "total" : 60,
    "updated" : 0,
    "created" : 60,
    "deleted" : 0,
    "batches" : 1,
    "version_conflicts" : 0,
    "noops" : 0,
    "retries" : {
      "bulk" : 0,
      "search" : 0
    },
    "throttled" : "0s",
    "throttled_millis" : 0,
    "requests_per_second" : -1.0,
    "throttled_until" : "0s",
    "throttled_until_millis" : 0,
    "failures" : [ ]
  }
}

```

## Post reindex ops
When the reindexing process is finished the documents are not visible because we disabled the `refresh_interval`.
Re-enable the `refresh_interval` and increase the `number_of_replicas`:
```
POST destination-index/_settings
{
  "index":{
    "refresh_interval":"30s"
    "number_of_replicas":"1"
  }
}
```
equivalent CURL command:
```
curl -X PUT https://dashboard:9200/destination-index/_settings \
-H "Content-Type: application/json" \
-d '{ "index":{ "refresh_interval":"30s" , "number_of_replicas":"1" } }' \
-u 'admin:admin' --insecure
```
