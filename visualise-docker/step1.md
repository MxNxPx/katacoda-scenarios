Katacoda has integrated [Weave Scope](https://weave.works/scope) to help visualise Docker and Kubernetes based deployments.

The aim of integrating Scope is to help people understand what has been deployed and as changes new aspects are deployed to automatically see the impact.

To launch Scope, click the Tab.

## Dynatrace oneagent Install
In your Dynatrace SaaS trial environment get the hostname
Under: profile>account settings>environment management>settings>environment
Copy this Dynatrace Host ID and store it

In your Dynatrace SaaS trial environment get the installerDownload token
Under: manage>deploy dynatrace>no access to host>set up paas integration>installerdownload>show token
Copy this Dynatrace installerDownload token and store it

Provide the DT info:
`read -p "Dynatrace Host ID: " DTHID && export DYNATRACE_HOST=$DTHID && read -p "Dynatrace Token: " DTOT && export DYNATRACE_OA_TOKEN=$DTOT`{{execute}}

Download and install the oneagent
`wget -O /tmp/Dynatrace-OneAgent-Linux.sh "https://${DYNATRACE_HOST}.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?arch=x86&flavor=default" --header="Authorization: Api-Token ${DYNATRACE_OA_TOKEN}" && /bin/sh /



## Tasks

Launch the application 
`cd /root/example-voting-app/ && docker-compose up -d`{{execute}}

Submit some data to the application (visit the "Dashboard" tab to see the results in real time) 
`nohup for i in $(seq 1 100); do VAL=$(shuf -n 1 -e a b); echo "VOTING: $VAL"; http --ignore-stdin -h -f POST "localhost:5000" vote=$VAL; done &`{{execute}}

Modify the application environment variables  
`cd /root/example-voting-app/ && ytt -f docker-compose.yml -f /root/OVERLAY_docker-compose.yml > docker-compose.yml.NEW && mv -fv docker-compose.yml{.NEW,}`{{execute}}

Restart the application 
`cd /root/example-voting-app/ && docker-compose down && sleep 5 && docker-compose up -d`{{execute}}

Create some cpu load 
`nohup stress --cpu 2 --timeout 300 &`{{execute}}



## Index.json

To add the visualise tab to your scenarios, include the following JSON snippet within the environments node. This will automatically add the tab to the scenarios. When the tab is pressed, the command to launch the Scope container will ru

<pre class="file">
"showvisualise": true,
"scope": "docker run --name=scope -d --net=host --pid=host --privileged -v /var/run/docker.sock:/var/run/docker.sock:rw weaveworks/scope:1.9.1 --probe.docker=true",
"scopePort": 4040,
</pre>


## Generated Web Link

Vote
https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com

Result
https://[[HOST_SUBDOMAIN]]-5001-[[KATACODA_HOST]].environments.katacoda.com


## Markdown

<pre>https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com</pre>

<pre>https://[[HOST_SUBDOMAIN]]-5001-[[KATACODA_HOST]].environments.katacoda.com</pre>


