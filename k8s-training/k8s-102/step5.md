---

## Deployments (again)

---

Now let's delete a single pod and see what happens.

Pod deletion takes time, so please allow up to 5 minutes. 

`kubectl delete pod $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name})`{{execute}}

Deleting a pod will take some time to delete, so please be patient. 

> _"pod "a123456-deployment-xxxx-xxxx" deleted"_

Notice that the pod name is different from the one before, this means that Kubernetes deployed a new pod when the pod gets deleted.

---

Now let's see everything created under the label "user=a123456". 

`kubectl get all -l user=a123456`{{execute}}


Now let's try deleting the deployment (allow up to 5 minutes). 


`kubectl delete deploy -l user=a123456`{{execute}}

> _"deployment.apps "a123456-deployment" deleted"_

And check what is happening to the Pods

`kubectl get all -l user=a123456 `{{execute}}

---

Lastly, run the command again and see what happens. After a few moments (allow up to 5 minutes), all Pods tied to the Deployment will be deleted.


Step 10: 
`kubectl get all -l user=a123456{{execute}}

> _"No resources found"_
