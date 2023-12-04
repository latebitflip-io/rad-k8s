kubectl create namespace argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm install --namespace argocd argocd argo/argo-cd