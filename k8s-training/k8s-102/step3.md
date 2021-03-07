---

## Working with Namespaces

---

Namespaces are a Kubernetes logical construct used for separating Kubernetes resources.  When using kubectl you can utilize the argument 'namespace' or the shorthand 'ns' to interact with namespaces.

---

## Namespace Basics


Let's see which namespace kubectl is configured to operate in using the "ns" krew plugin.

`kubectl ns -c`{{execute}}

> _“default”_

---

## Creating and Listing Namespaces

Let's use kubectl to create a new namespace.


`kubectl create ns sandbox`{{execute}}

> _“namespace/sandbox created”_


Execute the command below to list all namespaces in the cluster.

`kubectl get ns`{{execute}}
