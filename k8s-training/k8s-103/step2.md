---

## Deployments and Services

---

In order for the Pods within Kubernetes to communicate with each other, they must be bound to a Service. The beauty of Services in Kubernetes is that as Pods die and are redeployed, the Service that the application is bound to will route the traffic to the appropriate Pods as they become available. There is no need to manually go in and tell Kubernetes which Pods to route traffic to.


There are several different types of services in Kubernetes. The default one, and the one we will be using in this path, is ClusterIP. A service of type: ClusterIP gives an application an IP that is accessible from within the Kubernetes Cluster and a DNS entry that is accessible within the cluster.

---

## Create a deployment

Let's review the file called hello-web-deploy.yaml.

`cat hello-web-deploy.yaml`{{execute}}


Now apply it to the cluster.

`kubectl apply -f hello-web-deploy.yml`{{execute}}

> _"deployment.extensions/hello-web-a123456 created”_


---

## Validating a Service

Let's review the file called hello-web-svc.yaml.

`cat hello-web-svc.yaml`{{execute}}


Now apply it to the the cluster.

`kubectl apply -f hello-web-svc.yml`{{execute}}

> _“service/hello-web-service-a123456 created”_

---

## Validate the Service

Lastly, run the below command to list all services, deployments and pods with the label 'user=a123456'. 

`kubectl get svc,deploy,po -l user=a123456`{{execute}}

---

## Note 

In our service.yml, we did not specify a Type for our Service.  Kubernetes automatically assigned it a Type of ClusterIP and gave it a cluster internal IP address over the port that we declared.  A ClusterIP is NOT addressable directly from outside the cluster.