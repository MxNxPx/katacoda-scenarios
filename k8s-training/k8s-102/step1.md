## Kubernetes 102

---

**WARNING - YOU HAVE LESS THAN 1 HOUR BEFORE YOUR SESSION EXPIRES!**

>Note the time left (in HH:MM) for the session, it is in your prompt and updated after every command run:

![Terminal Time Remaining](./assets/term-expire.png)

## Kubernetes CLI, Namespaces, YAML, Deployments

In this lab, we are going to:
- Utilize the **kubectl** CLI to interact with our Kubernetes cluster 
- Create a Kubernetes **Namespace**
- Run an application by implementing a **Deployment**

A **Deployment** creates **Pods** and defines which container image(s) to use within a Pod, how many replicas of the Pods to maintain, and configuration options for the Pod. 
Kubernetes will maintain the health of the Pods deployed from the Deployment until the Deployment is deleted. 
That means that if a Pod dies that is part of a Deployment, Kubernetes will stand up a new Pod to return to the desired number of Pods (specified in the Deployment). 

---

## Kubernetes CLI - kubectl

Let's install a kubectl plugin manager called krew

```
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"${OS}_${ARCH}" &&
  "$KREW" install krew
)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```{{execute}}

> _"Installed plugin: krew"_


Let's install some kubectl plugins

`kubectl krew install whoami ctx ns`{{execute}}

> _“namespace/sandbox created”_


Run a kubectl command using one of the plugins

`kubectl krew whoami;echo`{{execute}}

> _"kubecfg:basicauth:admin"_
