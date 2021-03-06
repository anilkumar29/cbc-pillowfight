# cbc-pillowfight
cbc-pillowfight - Workload generator for Couchbase clusters running in Openshift

## Build the Docker image locally
```bash
docker build -f ./Dockerfile .
```

## Docker image
https://hub.docker.com/r/nmotte/cbc-pillowfight/

## Deploy injectors in Openshift
```bash
REPLICATION_CONTROLLER_SUFFIX=reader
REPLICA_COUNT=3
REGISTRY=#REGISTRY TO USE, PRIVATE OR PUBLIC#
BATCHSIZE=10000
NUMITEMS=150000000
PREFIX=acr1_123456789
NTHREADS=12
PERCENTAGE=0
NOPOPULATION=
MINSIZE=100
MAXSIZE=200
SPEC=couchbase://\\\$COUCHBASE_SERVICE_HOST/bucket_name
SASLPASS=bucket_password
USECS=120
oc create -f cbc-pillowfight-template.yaml; oc process cbc-pillowfight -v REGISTRY=$REGISTRY,BATCHSIZE=$BATCHSIZE,NUMITEMS=$NUMITEMS,PREFIX=$PREFIX,NTHREADS=$NTHREADS,NOPOPULATION=$NOPOPULATION,PERCENTAGE=$PERCENTAGE,MINSIZE=$MINSIZE,MAXSIZE=$MAXSIZE,SPEC=$SPEC,SASLPASS=$SASLPASS,USECS=$USECS,REPLICA_COUNT=$REPLICA_COUNT,REPLICATION_CONTROLLER_SUFFIX=$REPLICATION_CONTROLLER_SUFFIX | oc create -f -;
```
NB: In SPEC, you must Replace COUCHBASE with the name of the service exposed by the Couchbase cluster in Openshift
