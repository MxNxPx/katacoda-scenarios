## Question (4/10)

Note: All questions are mandatory. Once completed, click on the 'Check Answers' button to validate and continue to the next question.

![](./assets/Container-vs-vm.jpg)

## Translation of Concepts (Container lingo vs. Virtual Machine lingo)

Your container image repository can be compared to your data store for ISO images. The Dockerfile contains the step by step build instructions of the container image. It specifies which dependencies are to be installed and what configurations should be set, similar to an Ansible Template for a VM. You don't shut down/reboot/power on containers. Containers are lightweight and can be deployed within a matter of seconds. When you deploy a container, it instantly knows what it needs to do and it does that. If it crashes, a new one can be deployed and running almost immediately. If it is no longer needed, it can be killed and removed almost immediately as well. If built properly, you will never have to "logon" to a container to configure it to get it running. With VMs you experience downtime for patches and updates. With containers any new updates are specified in the Dockerfile. You build and deploy the new container per the Dockerfile. Once that container is up and running, the old container can be terminated.


>>Q4: What DON'T Containers require (if built properly) that VM's do?<<
() Maintenance
(*) Shut down/reboot/power on
() Orchestration
