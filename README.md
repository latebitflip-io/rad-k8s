# rad-k8s
a rad repo to jumpstart your k8s environment, the goal of this project is to provide a simple way to get a k8s cluster up and running with everything you need to get started. It is opinionated and will be based on the following assumptions:
- you host your code repos on github 
- you use helm for deploying your services


1. install helm 


- gitops first 
- argocd for syncing 
- crossplane for provisioning
- generic helm charts for backend service deployments 
- argo workflows 
- apisix for api gateway
- keda for autoscaling and serverless 
- vault secrets management vswh