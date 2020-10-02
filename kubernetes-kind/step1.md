Let's configure our `kubectl` to talk to that cluster:

`export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"`{{execute}}

And, now, let's talk to our cluster: `kubectl get nodes`{{execute}}

What does docker see?

`docker ps`{{execute}}

Awesome! We're rockin' and rollin'!
