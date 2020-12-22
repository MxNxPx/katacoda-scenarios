## Kubernetes 103, Section 1: Kubernetes Services

---

**WARNING - YOU HAVE LESS THAN 1 HOUR BEFORE YOUR SESSION EXPIRES!**

>Note the time left (in HH:MM) for the session, it is in your prompt and updated after every command run:

![Terminal Time Remaining](./assets/term-expire.png)

---

## Pushing a Deployment and a Service

In order for the Pods within Kubernetes to communicate with each other, they must be bound to a Service. The beauty of Services in Kubernetes is that as Pods die and are redeployed, the Service that the application is bound to will route the traffic to the appropriate Pods as they become available. There is no need to manually go in and tell Kubernetes which Pods to route traffic to.


There are several different types of services in Kubernetes. The default one, and the one we will be using in this path, is ClusterIP. A service of type: ClusterIP gives an application an IP that is accessible from within the Kubernetes Cluster and a DNS entry that is accessible within the cluster.

---

Step 1: 
First, let's create a deployment of nginx, it’s called deploy.yml. Select deploy.yml to run the script. 

Next, we need to apply deploy.yml to the cluster. Select the command below. 

`kubectl apply -f deploy.yml
`{{execute}}


After running the above command, “deployment.extensions/hello-web-a123456 created” will be displayed. 
---

# Validating a Service

Step 2: 
Then, apply the service to the cluster. Select the below command. 

`kubectl apply -f service.yml
`{{execute}}

After running the above command, “service/hello-service-a123456 created” will be displayed. 

Step 3:
To list all services, thus checking whether our service exists, you can run the below command:

`kubectl get services
`{{execute}}

Step 4:
Lastly, run the below command which will list all services, deployments and pods with the label 'user=a123456'. 
`kubectl get svc,deploy,po -l user=a123456
`{{execute}}

---

## Closing Notes 

svc, deploy, and po are short for service, deployment and pod

In our service.yml, we did not specify a Type for our Service. Kubernetes automatically assigned it a Type of ClusterIP and gave it a cluster internal IP address over the port that we declared.
