## Find your way through the maze of misrouted requests!


```bash
curl -w "@curl-format.txt" -o /dev/null -s "http://localhost:8080"
```

ingress-nginx
```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
```