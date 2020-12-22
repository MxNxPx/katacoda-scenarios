## Kubernetes 103, Section 2: Accessing a Service
---

**WARNING - YOU HAVE LESS THAN 1 HOUR BEFORE YOUR SESSION EXPIRES!**

>Note the time left (in HH:MM) for the session, it is in your prompt and updated after every command run:

![Terminal Time Remaining](./assets/term-expire.png)

---

## Deploying the Pod 

Now that we have a web server running and a service bound to it, we are able to access it from within the Kubernetes cluster. We can test this by deploying a new Pod in the cluster, shelling into it, and then curling the IP or DNS entry for the service.


Before deploying the Pod and curling the Service from within the Pod, ensure about 5 minutes has elasped to ensure both the deployment and services are running. 

Step 1: 

`kubectl run -n default -i --rm --restart=Never curl-test --generator=run-pod/v1 --image=radial/busyboxplus:curl -- sh -c "curl -vvv hello-service-a123456.default.svc.cluster.local"
`{{execute}}

The html page with the title "Welcome to nginx!" should be displayed. 

---

## Command Explanation of Deploying the Pod and Curling the Service from Within the Pod

-i : interactive, keeps STDIN (standard input) open even if not attached

--rm : deletes resources created in this command for attached containers

--restart=Never : creates a Pod by default if generator flag was not specified



curl-test : name of new Pod

--generator=run-pod/v1 : generate resources based on a set of inputs and is used to pin a particular behavior which may change in the future

--image=radial/busyboxplus:curl : this curl image was created as an alternate for those only needing to use curl to extract their configuration in their Hub containers.

-- sh : shelling into the new Pod

-c "curl -vvv hello-service-a123456": -c means to run the command that is within the "" in the Pod.

-vvv: very verbose output, displays extra information


---

## Port Forwarding and Deployment Deletion

Step 2:

Port Forward the nginx Pod to localhost:80

`kubectl port-forward $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name}) --address 0.0.0.0 8080:80
`{{execute}}
Forwarding from 0.0.0.0:8080 -> 80 Forwarding from [::1]:80 -> 80

Navigate to the dashboard tab, to the right of the terminal tab and enter "8080" as the port number. Then select "Display Port" and a "Welcome to nginx" screen should appear. Note that if you delete your Pod, a new one will be deployed by your Deployment, but you will have to re-run the kubectl port-forward command as your pod is now under a different name. 


Step 3:

Once finished, stop the port forward 

`^C
`{{execute ctrl-seq}}


Lastly, remove the service and the deployment with the below command:
`kubectl delete svc,deploy -l user=a123456
`{{execute}}

It should display deployment.apps "hello-web-a123456" deleted
