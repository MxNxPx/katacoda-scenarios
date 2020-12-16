#!/bin/bash


## set variables
dir=/root
threshold=${1:-4000}  #threshold for report time to be considered as long running
file=$dir/AS-ild-reporting-response.xml  #AS utility output xml file
backupfile="${file}.bak.$(date +"%Y-%m-%d_%H-%M")"  #where to store a backup of the file
backupfilelimit=5
output=$dir/output-parse-as.log
sizelimit=104857600  #100mb in bytes (100 x 1024 x 1024)

## rotate log if over size limit
touch $output
sizeoutput=$(stat -c '%s' $output)
if [[ $sizeoutput -gt $sizelimit ]]; then
  gzip -f $output
fi
if [[ $(ls -A1t $dir/*.xml.bak.*gz 2>/dev/null | wc -l) -gt $backupfilelimit ]]; then
  ls -A1rt $dir/*xml.bak.*gz | sed -e '1,'"${backupfilelimit}"'d' | xargs rm
fi

## AS utility invocation here
cp -f "${file}.orig" $file
#sleep 2

## copy xml to a backup, compress
cp -f $file $backupfile
gzip -fq $backupfile

## sanitize the xml a bit before processing
# remove the sessionID part of the tag
sed -i 's|\(<Session sessionID=.*>\)|<Session>|g' $file
# remove any lines with Owner value "svc_" or ProxySessionOwner tags
sed -i '/\(<Owner>.*.8451.com\\svc_.*\)/d; /\(<\/?ProxySessionOwner.*>\)/d' $file

## process xml and output relevant data
IFS=$'\n'
DATA=($(awk -v date="$(date +"%Y-%m-%d_%H:%M")" -v value=$threshold -v RS='</?Session>' -F'[<>]' '
    {delete a;
     for(i=1;i<=NF;i+=1) \
       if($i ~ ".*\\/([a-z]|[A-Z])") a[$i]=$(i-1);
       if(a["/RemoteServerAddress"]) split(a["/RemoteServerAddress"], r, ":");
       if(a["/RunningTime"]>value) \
         print date "|" a["/QueryID"] "|" a["/ClientMachine"] "|" r[1] "|" a["/Owner"] "|" a["/MaxQueryMemoryUsed"] "|" a["/RunningTime"] }' $file))

## write data to log
echo "Date|QueryID|ClientMachine|RemoteServerAddress|Owner|MaxQueryMemoryUsed|RunningTime" >> $output
printf -- "%s\n" "${DATA[@]}" >> $output
echo "Dynatrace output:" >> $output

## manipulate output to match dynatrace spec and send to stdout
# pull out relevant fields
COUNT=($(printf -- "%s\n" "${DATA[@]}" | awk -F'|' '{print $3 " " $4}' | sort | uniq -c))
# print using DT metric formatting
printf -- "%s\n" "${COUNT[@]}" | awk '{print "AS.long.running.reports.count,client=" $2 ",server=" $3 " " $1 ; }' | tee -a $output
echo >> $output
