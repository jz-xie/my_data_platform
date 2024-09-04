# Debezium Kafka Connector Deployment

## Code Structure

```bash
.
├── template (for CI usage only)
└── values
    ├── app1 (values for one set of connectors)
        ├── values.common.yaml (Required)
        ├── values.dev.yaml (Optional)
        ├── values.stg.yaml (Optional)
        └── values.prod.yaml (Optional)
```

For any new applications, please add them under `helm/app-name`

## How to create an deployment

1. Create a new folder under `helm/`. Please choose your folder name precisely because it will be used later. For example, your application is called `app-name` then the folder name should be `app-name` as well.
2. Create the Chart accordingly. Each Chart should have the following components
   1. `Chart.yaml` for chart info
   2. `values.$env.yaml` basic values for different environment
   3. `config.$env.json` basic configurations for the app
   4. `.values.$env.yaml` will be modified by CI, stores the image information
   5. `templates/` defines your deployment. For more details, please refer to [this doc](helm/app-lib/READMD.md)
3. Approach to [this file](https://gitlab.myteksi.net/dakota/dakota-k8s/-/tree/master/deployments/clusters/dakota/central/argocd/resources/app-services/datadev-appset.yaml) (dev) to add a new entry for your application. For production release please refer to [this folder](https://gitlab.myteksi.net/dakota/dakota-k8s/-/tree/master/deployments/clusters/dakota/central/prod-argocd/resources/app-services)

## How to deploy

1. When code is merged into master, the CI will auto update the corresponding `helm/$app_name/.values.dev.yaml` for the new tag.
2. When repo is tagged by `staging.vx.x.x`, CI will auto update the corresponding `helm/$app_name/.values.stg.yaml` for the new tag.
3. When repo is tagged by `production.vx.x.x`, CI will auto update the corresponding `helm/$app_name/.values.prod.yaml` for the new tag. (for now)
4. Since ArgoCD is following gitops pattern, when code is updated in gitlab, it will auto reflected on ArgoCD (no need for specific CD)
