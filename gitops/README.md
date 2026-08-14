helm repo add argo https://argoproj.github.io/argo-helm

helm repo update

helm install argocd argo/argo-cd \
  -n argocd \
  --create-namespace \
  -f argocd/values.yaml


kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d



```bash
python3 -c "import bcrypt; print(bcrypt.hashpw(b'admin', bcrypt.gensalt()).decode())"
```

```bash
openssl rand -base64 60 | tr -d '\n'
```