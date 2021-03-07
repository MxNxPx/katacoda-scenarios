## Kubernetes 102, Section 4: Applying the YML File

---

## Deployments

A **Deployment** creates **Pods** and defines which container image(s) to use within a Pod, how many replicas of the Pods to maintain, and configuration options for the Pod.
Kubernetes will maintain the health of the Pods deployed from the Deployment until the Deployment is deleted.
That means that if a Pod dies that is part of a Deployment, Kubernetes will stand up a new Pod to return to the desired number of Pods (specified in the Deployment).

---

## Preparing a YAML file for Kubernetes

YAML files are very particular about spacing. Always use the spaces to indent and never use tabs.

`cat deployment.yaml`{execute}}


## Pushing a Deployment 

Now, we let's apply the deployment.yaml file

`kubectl apply -f deployment.yaml`{{execute}}

> _"deployment.apps/a123456-deployment created"_


To ensure that the deployment was created, run the command below.

`kubectl get deployments`{{execute}}


Let's now check the status of the deployment and pods with the command below. 

`kubectl get all -l user=a123456`{{execute}}


Please Note: In our example we're going to use user=a123456, but in your use case, you'd use whatever is appropriate.

---

Notice that there is something called a ReplicaSet. Under the hood, a Deployment actually creates a ReplicaSet, which is responsible for maintaining the number of replicas for the Pod that you specified in your Deployment.

![](./assets/K8-Deployments.png)


---

You can use the kubectl logs command to view stdout (standard output) and stderr (standard error - error messages or diagnostics) from Pods.

`kubectl -n default logs deployment/a123456-deployment --tail=10`{{execute}}

> _"Hello world!"_


Congrats! Your first Kubernetes Deployment is live!

kubectl logs is a command that views the stdout (standard output) and stderr (standard error - outputs error messages or diagnostics) from Pods.

Now let's delete a single pod and see what happens.

Pod deletion takes time, so please allow up to 5 minutes. 


`kubectl delete pod $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name})`{{execute}}

Deleting a pod will take some time to delete, so please be patient. 

> _"pod "a123456-deployment-xxxx-xxxx" deleted"_

Notice that the pod name is different from the one before, this means that Kubernetes deployed a new pod when the pod gets deleted.

---

Now let's see everything created under the label "user=a123456". 

Step 7:
`kubectl get all -l user=a123456
`{{execute}}

Now let's try deleting the deployment (allow up to 5 minutes). 


Step 8:
`kubectl delete deploy -l user=a123456
`{{execute}}

deployment.apps "a123456-deployment" deleted
And check what is happening to the Pods


Step 9:
`kubectl get all -l user=a123456
`{{execute}}

---

Lastly, run the command again and see what happens. After a few moments (allow up to 5 minutes), all Pods tied to the Deployment will be deleted.


Step 10: 
`kubectl get all -l user=a123456
`{{execute}}

"No resources found" should be displayed. 
