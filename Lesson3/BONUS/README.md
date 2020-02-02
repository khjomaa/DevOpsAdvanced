Commands:
* ```minikube addons enable ingress```
* ```docker build -t khjomaa/db-creds-nginx:latest .```
* ```docker run --name db_nginx -p 8080:80 -d khjomaa/db-creds-nginx:latest```
* ```docker push khjomaa/db-creds-nginx:latest```
* ```kubectl apply -f ./```
