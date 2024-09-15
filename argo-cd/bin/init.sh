# # install argocd
# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# kafka operator
kubectl create namespace kafka-operator
helm repo add strimzi https://strimzi.io/charts/
helm install strimzi-kafka-operator strimzi/strimzi-kafka-operator -n kafka-operator --create-namespace  -f kafka-operator/values.yaml

# kafka cluster
kubectl create namespace kafka
kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kafka

# mysql
kubectl apply -f mysql/deployment.yaml

# debezium
docker build . -t strimzi-kafka-connect-local:dev -f kafka-connect-debezium/docker/Dockerfile
helm install cdc-test . -f kafka-connect-debezium/helm/values/test_b/values.yaml -n kafka-connect