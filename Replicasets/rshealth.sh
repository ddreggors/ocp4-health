#!/bin/bash
res=$(oc get replicasets -A|awk '{ if($1~/NAME|openshift/ && ($3!=$4 || $4!=$5)) {print $0} }')
numlines=$(wc -l <<<${res})
cluster=$(oc whoami --show-server|awk -F'/' '{split($3, host, "."); print host[2]}'|tr '[:lower:]' '[:upper:]')
echo -n "The state of replicasets in ${cluster} is "
if [ ${numlines} -gt 1 ]; then
        state="NOT HEALTHY"
        echo "${state}"
        echo "${res}"
else
        state="HEALTHY"
        echo "${state}"
fi
