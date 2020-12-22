## Kubernetes 104, Section 3: Editing a ConfigMap

---

**WARNING - YOU HAVE LESS THAN 1 HOUR BEFORE YOUR SESSION EXPIRES!**

>Note the time left (in HH:MM) for the session, it is in your prompt and updated after every command run:

![Terminal Time Remaining](./assets/term-expire.png)

---

## ConfigMap Editing


One of the benefits of using a ConfigMap is that they allow you to make edits to a Pod without having to redeploy. So to change our index.html page, rather than editing the nginx deployment itself, we can edit the ConfigMap.


Change the index.html page by editing your ConfigMap YAML, via vim. When you are done, apply it.

Step 1:
This command allows you to edit your config-map.yml file. 

`vim config-map.yml
`{{execute}}

Edit the file with the command below. 

`i
`{{execute no-newline}}

Then arrow-down to the index.html section, and edit the text inside the h1 tags. 

Once finished, select the below command. 
`^ESC
`{{execute ctrl-seq}}


Now save and exit. 
`:wq!
`{{execute}}


Step 2:
Now, apply the config-map.yml file using the below command. 

`kubectl apply -f config-map.yml
`{{execute}}

It will display “configmap/nginx-index-a123456 configured”


It will take a few moments for the changes to be applied. Please wait up to 3 minutes after applying the config-map.yml file for the changes to be applied. Under the hood, nginx is monitoring the ConfigMap. If a change is applied to the ConfigMap, it will write the new index.html file. All of this is done without a restart of the nginx Pod.
See the changes:

Step 3:
`kubectl run -n default -i --rm --restart=Never curl-test --generator=run-pod/v1 --image=radial/busyboxplus:curl -- sh -c "curl -vvv hello-service-a123456.default.svc.cluster.local"
`{{execute}}

Your configmap change should now be displayed.
