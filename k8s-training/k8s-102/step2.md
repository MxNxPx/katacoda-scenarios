## Kubernetes 102

---

## Namespace Creation

Namespaces are a Kubernetes logical construct used for separating Kubernetes resources.

`kubectl config current-context`{{execute}}
> “default”

`kubectl create ns sandbox`{{execute}}
> “namespace/sandbox created”


The command below will list the current namespaces in a cluster. 

`kubectl get namespace`{{execute}}
