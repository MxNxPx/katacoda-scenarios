---

## Service Communication

---

Now that we have a web server running and a service bound to it, we are able to access it from within the Kubernetes cluster.  We can test this by deploying a new Pod in the cluster that uses the curl command to communicate via DNS entry for the service.

---


`kubectl run -n default -i --restart=Never --rm curl-test --generator=run-pod/v1 --image=radial/busyboxplus:curl -- sh -c "curl -vvv hello-service-a123456.default.svc.cluster.local"`{{execute}}

> _"Welcome to nginx!"_

---

## Command Explanation of Deploying the Pod and Curling the Service from Within the Pod

-i : interactive, keeps STDIN (standard input) open even if not attached

--restart=Never : creates a Pod by default if generator flag was not specified

--rm : deletes resources created after executing

curl-test : name of the Pod to be spun up

--generator=run-pod/v1 : generate resources based on a set of inputs and is used to pin a particular behavior which may change in the future

--image=radial/busyboxplus:curl : this curl image was created as an alternate for those only needing to use curl to extract their configuration in their Hub containers.

-- sh : shelling into the new Pod

-c : "curl -vvv hello-service-a123456": -c means to run the command that is within the "" in the Pod.

-vvv : very verbose output, displays extra information


---

## Port Forwarding

Port Forward the nginx Pod to localhost:80

`kubectl port-forward $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name}) --address 0.0.0.0 8080:80`{{execute}}
> _"Forwarding from 0.0.0.0:8080 -> 80 Forwarding from [::1]:80 -> 80"_

Navigate to the dashboard tab, to the right of the terminal tab and enter "8080" as the port number. Then select "Display Port" and a "Welcome to nginx" screen should appear. Note that if you delete your Pod, a new one will be deployed by your Deployment, but you will have to re-run the kubectl port-forward command as your pod is now under a different name. 


## Cleanup

Once finished, stop the port forward 

`^C`{{execute ctrl-seq}}


Lastly, remove the service and the deployment with the below command:
`kubectl delete svc,deploy -l user=a123456`{{execute}}

> _"deployment.apps "hello-web-a123456" deleted"_
