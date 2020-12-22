## Kubernetes 102, Section 4: Applying the YML File

---

**WARNING - YOU HAVE LESS THAN 1 HOUR BEFORE YOUR SESSION EXPIRES!**

>Note the time left (in HH:MM) for the session, it is in your prompt and updated after every command run:

![Terminal Time Remaining](./assets/term-expire.png)

---

## Setting Context

We know since this is a sandboxed environment, the cluster will be "default". If this were a local machine, we would have to ensure we're pointed to the proper cluster before applying the YML file to our Kubernetes cluster with the command below. 


Step 1:
`kubectl config current-context
`{{execute}}


## Pushing a Deployment 

Now, we must apply the deployment.yml file

Step 2:
`kubectl apply -f deployment.yml
`{{execute}}

deployment.apps/a123456-deployment created

To ensure that the deployment was created, run the command below.

Step 3:
`kubectl get deployments
`{{execute}}

Let's now check the status of the deployment with the command below. 

Step 4:
`kubectl get all -l user=a123456
`{{execute}}


Please Note: In our example we're going to use user=a123456, but in your use case, you'd use whatever is appropriate.

---

Notice that there is something called a ReplicaSet. Under the hood, a Deployment actually creates a ReplicaSet, which is responsible for maintaining the number of replicas for the Pod that you specified in your Deployment.


Find your output! Use kubectl logs and then the name of your pod to see the output.

![](./assets/K8-Deployments.png)


---

Step 5:
`kubectl -n default logs deployment/a123456-deployment --tail=10
`{{execute}}

"Hello world!" Should be displayed

Congrats! Your first Kubernetes Pod is live!

kubectl logs is a command that views the stdout (standard output) and stderr (standard error - outputs error messages or diagnostics) from Pods.

Now let's delete a single pod and see what happens.

Pod deletion takes time, so please allow up to 5 minutes. 


Step 6:
`kubectl delete pod $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name})
`{{execute}}

Deleting a pod will take some time to delete, so please be patient. 

pod "a123456-deployment-xxxx-xxxx" deleted

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
