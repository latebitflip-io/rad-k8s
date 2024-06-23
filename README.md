# rad-k8s
a rad repo to jump start your k8s environment, the goal of this project is to provide a simple way to get a k8s cluster up and running with everything needed to get started. It is opinionated and will be based on the following assumptions:
- code repos on github 
- helm is used for deploying your services

### Local machine or vm must that will bootstrap the cluster:
- install helm 
- install argocd cli
- install vault cli


### Make sure a cluster (GCP, DO, AWS, Kind, Docker desktop) is running and that it is accessible with kubectl

1. fork https://github.com/lateflip-io/rad-k8s name to whatever you like and make it private
2. clone the repo locally or a running VM
3. run ./bootstrap.sh
4. kubectl port-forward vault-0 8200 &
5. run: `vault kv put secret/credentials/github GITHUB_USER=base64-username`
6. run: `vault kv put secret/credentials/github GITHUB_PASS=base64-password`
7. run: `vault kv put secret/demosecret/aws GITHUB_REPO=base64-url`
8. run: `kubectl apply -f control-plane/infrastructure/secrets/github-credential-template.yaml`
8. kubectl port-forward service/argocd-server -n argocd 8080:443
9. http://localhost:8080
10. get `admin` credentials: kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
11. login to argocd with `admin` and the password
12.
13.


## This will setup the following: 
- gitops first 
- argocd for syncing 
- crossplane for provisioning
- generic helm charts for backend service deployments 
- argo workflows 
- apisix for api gateway
- keda for autoscaling and serverless 
- vault secrets management vswh
