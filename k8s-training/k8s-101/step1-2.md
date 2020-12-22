## Question (6/10)

Note: All questions are mandatory. Once completed, click on the 'Check Answers' button to validate and continue to the next question.

---

## Kubernetes Overview

Applications are deployed in Kubernetes as Pods. Pods are the smallest unit within Kubernetes and consist of one or more containers.

For as long as the application is deployed, Kubernetes will maintain the desired state of that application. If a Pod were to crash, or a node within a cluster were to go down, Kubernetes will redeploy the Pods on any available node within the cluster.

When an updated version of an application needs to be deployed, Kubernetes can deploy the updated Pods in a "rolling" fashion, eliminating downtime. If an application is experiencing heavy load, Kubernetes can also be configured to scale accordingly by deploying more Pods as needed.

![](./assets/K8-Pods.png)

---

>>Q6: What are the smallest unit within Kubernetes?<<
=== Pods
