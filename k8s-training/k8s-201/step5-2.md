## Question (10/10)

Note: All questions are mandatory. Once completed, click on the 'Check Answers' button to validate and continue to the next question.

---

## Kubernetes Master
The Kubernetes Master is a collection of processes that are responsible for scheduling all tasks within the Kubernetes environment and maintaining the cluster's desired state. Each command you send via kubectl is sent to the master. The Master (AKA the "brain" of Kubernetes) can also reside on its own reserved Node. The Master is responsible for maintaining the state of objects within the cluster. If a Pod crashes, the Master will kill the Pod and deploy a new one immediately. Since a Pod is comprised of containers, they can be rapidly deployed, reconfigured and redeployed. If the Pods that make up an application that is deployed in Kubernetes are out of date or need to be changed, they will be replaced with new Pods that contain the new revisions. Pods are like Cattle, whereas VMs are like Sheep. You will have numerous amounts of Pods. If one is lost, it doesn't have a major impact on your herd of cattle and can be replaced easily with a new one without noticing a major difference. They are easy to take care of and low maintenance. You just need to be able to manage them all at once, quickly and efficiently. On the contrary, sheep require more love and attention. You nurse and take care of a sheep so that it can stay healthy. If you don't maintain its health and monitor it, the sheep may get sick and you will lose the value of that sheep, which could directly impact your well being (if you are a shepherd and sell sheep to stay alive). You know each of your sheep by name and replacing that sheep will be difficult as each one is unique. If you neglect your VMs by not patching and maintaining them, they become more prone to failure, and could be easily noticeable if one were to be lost.


>>Q10: Do VM's or Pods require more maintainence? << 
=~= VM's
