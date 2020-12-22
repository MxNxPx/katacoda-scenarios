## Question (3/10)

Note: All questions are mandatory. Once completed, click on the 'Check Answers' button to validate and continue to the next question.

## Container Lifecycle

With all of this said, containers are not always going to be the answer. There will still be use cases for deploying to a VM vs. deploying containers. One thing containers are not recommended for are stateful applications, or applications that need to store information in a persistent storage volume. Since containers are ephemeral and are frequently deployed and redeployed on a Docker host, they by default do retain any information, files, or local configuration changes from runtime. On each deployment, a fresh image of that container is pulled from an image repository (which can contain one or more versions of that container image). Once the image is pulled, the Docker engine on the host will cache a copy of the image. The Docker host will use the cached copy of an image for deployments until changes are detected on that image. If there are any new changes to be made to a container, the container's image must be rebuilt, pushed to the repository and redeployed. When deployed, the Docker engine will notice the image in the image repository differs from its cached copy. Then, only new or updated layers of that image will be pulled down to the image that is has cached. Once pulled, the container will be deployed.


>>Q3: Containers are recommended for stateful applications.<<
() True
(*) False
