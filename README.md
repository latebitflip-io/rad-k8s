# rad-k8s
a rad repo to jumpstart your k8s environment, the goal of this project is to provide a simple way to get a k8s cluster up and running with everything you need to get started. It is opinionated and will be based on the following assumptions:
- you host your code repos on github 
- you use helm for deploying your services

Make sure you have a cluster running and you can acccess it via kubectl.
1. install helm 
2. run ./bootstrap.sh
3. kubectl port-forward service/argocd-server -n argocd 8080:443
4. http://localhost:8080
5. get `admin` credentials: kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
6. login to argocd with `admin` and the password from the previous step
7. create a credential template by using the connect repo, adding credentials for the root of your org



- gitops first 
- argocd for syncing 
- crossplane for provisioning
- generic helm charts for backend service deployments 
- argo workflows 
- apisix for api gateway
- keda for autoscaling and serverless 
- vault secrets management vswh