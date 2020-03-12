# DNS Nat Check
Check the NAT table in iptables for dns pod ips.


The iptables nat table on all nodes should have the ip for all dns pods, this should be sync'ed as dns pods are added and removed normally.

The script is ran as follows, no need flags are needed.

```
$ ./dns_nat_chk.sh
[2020-03-11 16:57:34] ip 10.128.4.2 does not exist in worker-node-0.mydomain.com iptables nat table
12:57
[2020-03-11 16:57:34] ip 10.130.2.2 does not exist in worker-node-0.mydomain.com iptables nat table
12:57
[2020-03-11 16:57:34] ip 10.129.0.2 does not exist in worker-node-0.mydomain.com iptables nat table
12:57
[2020-03-11 16:57:34] ip 10.128.2.2 does not exist in worker-node-0.mydomain.com iptables nat table
```
