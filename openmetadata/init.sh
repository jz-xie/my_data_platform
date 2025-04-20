
helm upgrade --install airflow apache-airflow/airflow --namespace airflow --create-namespace

helm install opensearch opensearch/opensearch -n openmetadata \
--set 'extraEnvs[0].name=OPENSEARCH_INITIAL_ADMIN_PASSWORD,extraEnvs[0].value=asAWQc1!4315435234' \
--set 'singleNode=true'

helm install my-release oci://registry-1.docker.io/bitnamicharts/postgresql

cU5JfALsnW% 

docker compose -f docker-compose-postgres.yml --env-file ./openmetadata_config.env up