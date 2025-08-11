## Find your way through the maze of misrouted requests!


```bash
curl -w "@curl-format.txt" -o /dev/null -s "http://localhost:8080"
```

#### Ingress-nginx
```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
```

```bash
helm template pathfinder ./helm -s templates/deployment.yaml -f ./helm/values.yaml
```


#### Add the chart repo:
```bash
helm repo add highonsemicolon https://highonsemicolon.github.io/pathfinder
helm repo update
```

#### Install with default values:
```bash
helm install pathfinder highonsemicolon/pathfinder
```