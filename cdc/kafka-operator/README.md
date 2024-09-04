# Strimzi: Apache Kafka on Kubernetes

To install Strimizi Kafka Operator from default chart

1. `helm repo add strimzi https://strimzi.io/charts/`
2. `kubectl create namespace kafka`
3. `helm install strimzi-kafka-operator strimzi/strimzi-kafka-operator -n kafka-operator --create-namespace  -f values.yaml`
