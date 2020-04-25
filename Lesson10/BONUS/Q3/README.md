## Bonus - Q3

Install helm S3 plugin:
- ```helm plugin install https://github.com/hypnoglow/helm-s3.git```
![](../../images/s3-plugin-1.png)

Create the bucket:
    - ```cd cd BONUS/Q3/projects/my-bucket```
    - ```terraform init```
    - ```terraform apply --auto-approve```
![](../../images/helm-1.png)

Add S3 bucket as helm repo:
- ```helm repo add my-charts s3://khalil-helm-central-bucket/charts```
- ```helm repo update```
- ```helm repo list```
![](../../images/helm-2.png)
    
Pull helm chart and push it to S3 bucket:
1. ```helm fetch stable/rabbitmq```
2. ```helm s3 push rabbitmq-6.18.2.tgz my-charts --force```
3. ```helm search repo my-charts```

![](../../images/helm-3.png)

![](../../images/helm-4.png)

Delete chart from helm S3:
1. list charts by running: ```helm search repo my-charts```
2. Delete by running: ```helm s3 delete rabbitmq --version 6.18.2 my-charts```

![](../../images/helm-5.png)

Delete Helm S3 Repo:
- Run: ```helm repo remove my-charts```

Delete Se Bucket:
- Run: ```terraform destroy --auto-approve```
