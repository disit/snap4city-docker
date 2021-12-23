docker-compose exec opensearch-n1 bash -lic "plugins/opensearch-security/tools/securityadmin.sh -f plugins/opensearch-security/securityconfig/internal_users.yml -t internalusers -icl -nhnv -cacert config/root-ca.pem -cert config/admin.pem -key config/admin-key.pem"

