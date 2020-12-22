## Question (7/10)

Note: All questions are mandatory. Once completed, click on the 'Check Answers' button to validate and continue to the next question.

## High Level Overview of Kubernetes

Kubernetes builds on top of Docker. It adds its own layers of infrastructure. Scaling down from the top layer, Kubernetes (also known as K8s - pronounced "kates") consists of Clusters, Nodes, and Pods. A Cluster is a pool of Nodes, whose resources are combined and shared across the cluster. A Node is commonly referred to as a host. In a typical environment, a Node is a virtual machine or physical host with a specialized operating system that is optimized for running the Docker engine. A Cluster can consist of any number of Nodes. Pods are what get
deployed onto these Nodes. A Pod receives its own IP address within the cluster and consists of one or more containers or storage volumes. Each container in a Pod shares kernel space with the Node it resides on. When a Pod is deployed, Kubernetes will find a Node that has the available resources to run that Pod. 

>>Q7: How do you collect information and declare objects within Kubernetes?<< 
=~= Kubectl commands, YAML files
