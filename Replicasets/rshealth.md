# Replicaset Health Check
Check for mismatch in DESIRED, CURRENT, and READY pods

The Desired number of pods, the current count of pods online, and the number of read pods should all match in each replicaset. This script will check ALL replicasets in every project.

To check the over all state of all replicasets, just run the script.
```
$ ./rshealth.sh
The state of replicasets in MYCLUSTER is NOT HEALTHY
NAMESPACE                                               NAME                                                               DESIRED   CURRENT   READY   AGE
openshift-metering                                      reporting-operator-55c9f55bc9                                      1         1         0       28d
```
