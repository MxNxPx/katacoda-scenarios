
## Dynatrace oneagent Install
In your Dynatrace SaaS trial environment get the hostname

>Under: profile>account settings>environment management>settings>environment

>Copy this Dynatrace Host ID and store it


In your Dynatrace SaaS trial environment get the installerDownload token

>Under: manage>deploy dynatrace>no access to host>set up paas integration>installerdownload>show token

>Copy this Dynatrace installerDownload token and store it


Provide the DT info:

`clear && read -p "[*] Enter your Dynatrace Host ID: " DTHID && export DYNATRACE_HOST=$DTHID && read -p "[*] Enter your Dynatrace Token: " DTOT && export DYNATRACE_OA_TOKEN=$DTOT`{{execute}}

Download and install the oneagent

`wget -O /tmp/Dynatrace-OneAgent-Linux.sh "https://${DYNATRACE_HOST}.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?arch=x86&flavor=default" --header="Authorization: Api-Token ${DYNATRACE_OA_TOKEN}" && /bin/sh /tmp/Dynatrace-OneAgent-Linux.sh --set-app-log-content-access=true --set-infra-only=false`{{execute}}


---


## Tasks (Voting App)

Launch the application 

`cd /root/example-voting-app/ && docker-compose up -d`{{execute}}

Submit some data to the application (visit the "Dashboard" tab to see the results in real time) 

`nohup /usr/local/bin/vote.sh </dev/null >nohup.out 2>nohup.err &`{{execute}}

Modify the application environment variables  

`cd /root/example-voting-app/ && ytt -f docker-compose.yml -f /root/OVERLAY_docker-compose.yml > docker-compose.yml.NEW && mv -fv docker-compose.yml{.NEW,}`{{execute}}

Restart the application 

`cd /root/example-voting-app/ && docker-compose down && sleep 5 && docker-compose up -d`{{execute}}

Create some cpu load 

`nohup stress --cpu 2 --timeout 300 </dev/null >nohup.out 2>nohup.err &`{{execute}}


---


## Tasks (Easy Travel App)

Modify the application environment variables  

`cd /root/easyTravel-Docker/ && ytt -f docker-compose.yml -f /root/OVERLAY_easy-travel_docker-compose.yml > docker-compose.yml.NEW && mv -fv docker-compose.yml{.NEW,}`{{execute}}

Launch the application 

`cd /root/easyTravel-Docker/ && docker-compose up -d`{{execute}}


---


## Generated Web Link

Vote
https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com

Result
https://[[HOST_SUBDOMAIN]]-5001-[[KATACODA_HOST]].environments.katacoda.com

Easy Travel
https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com





