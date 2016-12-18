# cbc-pillowfight
cbc-pillowfight - Stress Test for Couchbase Client and Cluster

##Build the docker image
```bash
docker build -f ./Dockerfile .
```

##Deploy in Openshift
```bash
oc create -f cbc-pillowfight-template.yaml; oc process cbc-pillowfight -v REGISTRY=$REGISTRY,BATCHSIZE=$BATCHSIZE,NUMITEMS=$NUMITEMS,PREFIX=$PREFIX,NTHREADS=$NTHREADS,NOPOPULATION=$NOPOPULATION,PERCENTAGE=$PERCENTAGE,MINSIZE=$MINSIZE,MAXSIZE=$MAXSIZE,SPEC=$SPEC,SASLPASS=$SASLPASS,USECS=$USECS,REPLICA_COUNT=$REPLICA_COUNT,REPLICATION_CONTROLLER_SUFFIX=$REPLICATION_CONTROLLER_SUFFIX | oc create -f -;
```
