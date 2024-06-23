kubectl create namespace argocd
kubectl create namespace vault-infra
kubectl label namespace vault-infra name=vault-infra

helm repo add argo https://argoproj.github.io/argo-helm
helm install --namespace argocd argocd argo/argo-cd

helm upgrade --install --wait vault-operator oci://ghcr.io/bank-vaults/helm-charts/vault-operator
kubectl kustomize https://github.com/bank-vaults/vault-operator/deploy/rbac | kubectl apply -f -
kubectl kustomize https://github.com/bank-vaults/vault-operator/deploy/crd | kubectl apply -f -
helm upgrade --install --wait vault-secrets-webhook oci://ghcr.io/bank-vaults/helm-charts/vault-secrets-webhook --namespace vault-infra

kubectl apply -f control-plane/infrastructure/secrets/github-credential-template.yaml
#
