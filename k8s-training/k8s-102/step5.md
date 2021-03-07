---

## Deployments (again)

Kubernetes is going to always try to maintain the "desired state" provided by the user to the system.

---

Let's delete a single pod and see what happens.

Deleting a pod will take some time to delete, so please be patient. 

`kubectl delete pod $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name})`{{execute}}

> _"pod "a123456-deployment-xxxx-xxxx" deleted"_


---

Now let's see everything created under the label "user=a123456". 

`kubectl get all -l user=a123456`{{execute}}


Notice that the new pod name is different from the one deleted, this is because Kubernetes didn't resurrect the old pod but stood up a new replacement pod.

---

Now let's try deleting the deployment (allow up to 5 minutes). 


`kubectl delete deploy -l user=a123456`{{execute}}

> _"deployment.apps "a123456-deployment" deleted"_


And check what is happening to the Pods

`watch kubectl get all -l user=a123456`{{execute}}


CTRL+c to stop watching the progress

`^C`{{execute ctrl-seq}}

---

Lastly, run the command again and see what happens. After a few moments (allow up to 5 minutes), all Pods tied to the Deployment will be deleted.


`kubectl get all -l user=a123456{{execute}}

> _"No resources found"_

---

##That's all for this lab!!!

