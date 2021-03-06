## Kubernetes 102

---

## Kubernetes CLI - kubectl

---

## kubectl plugins

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
