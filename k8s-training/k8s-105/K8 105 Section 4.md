## Kubernetes 105, Section 4: Test Logging Into Test Manager UI

---

**WARNING - YOU HAVE LESS THAN 1 HOUR BEFORE YOUR SESSION EXPIRES!**

>Note the time left (in HH:MM) for the session, it is in your prompt and updated after every command run:

![Terminal Time Remaining](./assets/term-expire.png)

---

## Test Manager UI Interactive Demo

Step 1:
The environment variables we defined are the username and password for the Tomcat Manager UI. This is found at http://tomcat-server:8080/manager/html
Exec into the Tomcat Pod and curl localhost/manager and check the response code:
To do this, we first need the name of the Tomcat Pod
`kubectl get pods -l user=a123456
`{{execute}}
 
 
Step 2:
The below command Exec’s into the Pod, curls localhost, returns output, looks for response code, then exits the exec session:
`kubectl exec -it $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name}) -- sh -c "curl -is localhost:8080/manager/html | grep HTTP"
`{{execute}}

This should return HTTP/1.1 401 because we did not specify a username and password.


Step 3:
The below command Logs in using the username and password defined in the Secret (as environment variables), ensures the -is is lower case and not upper when using curl. The secrets deployed are environment variables. 

`kubectl exec -it $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name}) -- sh -c "curl –is -u admin:password localhost:8080/manager/html | grep HTTP"
`{{execute}}

This should return HTTP/1.1 200
