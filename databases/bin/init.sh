scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

kubectl create namespace mysql

kubectl apply -f $scriptDir/../mysql/deployment.yaml -n mysql