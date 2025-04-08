# jupyterlab_k8
Deployment files to install JupiterLab on K8 cluster

kubectl apply -f jupyterlab-pvc.yaml
kubectl apply -f jupyterlab-deployment.yaml

kubectl apply -f jupyterlab-service.yaml

### Using load balancer
kubectl get svc jupyterlab-service


### Using Dockerfile
##### First create a custome image
docker build -t custom-jupyterlab .

docker tag custom-jupyterlab yourusername/custom-jupyterlab:latest

docker push yourusername/custom-jupyterlab:latest

docker login your-private-registry

docker tag custom-jupyterlab your-private-registry/yourusername/custom-jupyterlab:latest

docker push your-private-registry/yourusername/custom-jupyterlab:latest

##### Now make changes in deployment.yaml to use this image

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jupyterlab
spec:
  replicas: 1
  selector:
    matchLabels:
      app: jupyterlab
  template:
    metadata:
      labels:
        app: jupyterlab
    spec:
      containers:
        - name: jupyterlab
          image: yourusername/custom-jupyterlab:latest  # Replace with your custom image
          ports:
            - containerPort: 8888
          env:
            - name: JUPYTER_ENABLE_LAB
              value: "yes"  # This ensures that JupyterLab is enabled instead of Jupyter Notebook
```

##### Finally apply the modified deployment
kubectl apply -f jupyterlab-deployment.yaml



