helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
kubectl create namespace istio-system
kubectl label namespace default istio-injection=enabled
helm install istio-base istio/base -n istio-system
helm install istiod istio/istiod -n istio-system -f istiod-values.yaml
kubectl create namespace otel-system
kubectl apply -f otel-collector.yaml

