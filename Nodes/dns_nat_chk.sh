#!/bin/bash
# Get a list of DNS pods ips
dns_pod_ips=`oc get pods -n openshift-dns -o wide|awk '/dns-default/&&/Running/{print $6}'`
# Get a list of nodes and iterate over each one
for n in `oc get nodes | awk '!/NAME/{ print $1 }'`
do
  echo "------------------- ${n} -------------------"
  state="GOOD"
  # Gether the datestamp and NAT ips from iptables on the current node
  rawnat=`oc debug node/${n} -- bash -c 'chroot /host iptables -t nat -nvL' 2>/dev/null`
  natlist=$(echo "${rawnat}"|awk '/udp/&&/5353/{split($11, ips, ":"); print ips[2]}')
  ndate=`oc debug node/${n} -- bash -c 'chroot /host date +"%F %H:%M:%S"' 2>/dev/null`
  for ip in ${dns_pod_ips}; do
    found="is not"
    for natip in ${natlist}; do
      if [ "${natip}" = "${ip}" ]; then
              found="is"
      fi
    done
    if [ "${found}" = "is not" ]; then state="BAD"; fi
    echo "[${ndate}] The ip ${ip} ${found} in ${n} iptables nat table"
   done
   echo "[${ndate}] Node State: ${state}"
done
