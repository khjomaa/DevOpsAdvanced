minikube addons enable ingress
kubectl get pods --all-namespaces

docker build -t khjomaa/db-creds-nginx:latest .
docker run --name db_nginx -p 8080:80 -d khjomaa/db-creds-nginx:latest
docker push khjomaa/db-creds-nginx:latest

kubectl apply -f db-secret.yaml
kubectl describe secrets db-creds

kubectl apply -f db-ingress.yaml

kubectl delete deploy username password url
kubectl delete svc username-svc password-svc url-svc
kubectl delete ingresses db-ingress
kubectl delete secrets db-creds
