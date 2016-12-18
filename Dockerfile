FROM centos:latest
MAINTAINER Nicolas Motte <lingusinpg@gmail.com>

RUN yum update && \
yum -y install wget && \
wget http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-2-x86_64.rpm && \
rpm -iv couchbase-release-1.0-2-x86_64.rpm && \
yum -y install libcouchbase-devel libcouchbase2-bin gcc gcc-c++ && \
mkdir -p /home/cbc-pillowfight && \
groupadd -r cbc-pillowfight -g 433 && \
useradd -u 431 -r -g cbc-pillowfight -d /home/cbc-pillowfight -s /sbin/nologin -c "Docker image user" cbc-pillowfight && \
chown -R cbc-pillowfight:cbc-pillowfight /home/cbc-pillowfight
USER cbc-pillowfight
ENTRYPOINT eval SPEC=$SPEC && cbc-pillowfight -p $PREFIX -U $SPEC -P $SASLPASS --num-threads=$NTHREADS -m $MINSIZE -M $MAXSIZE -r $PERCENTAGE $NOPOPULATION -I $NUMITEMS -D operation_timeout=$USECS
