# jupiterlab_k8
Deployment files to install JupiterLab on K8 cluster

kubectl apply -f jupyterlab-pvc.yaml
kubectl apply -f jupyterlab-deployment.yaml

kubectl apply -f jupyterlab-service.yaml

### Using load balancer
kubectl get svc jupyterlab-service

