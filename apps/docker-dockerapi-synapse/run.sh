#!/bin/bash
if [ "$SYNAPSE_APP" == "" ];then
  echo "SYNAPSE_APP environment variable must be set" >&2
  exit 1
fi
if [ "$SYNAPSE_PORT" == "" ];then
  echo "SYNAPSE_PORT environment variable must be set" >&2
  exit 1
fi
HOSTOUT=$(host etcd 2>&1);
if [ $? != 0 ];then
  echo "Cannot find host named 'etcd', you need to link an etcd container to this container!" >&2
  echo "$HOSTOUT" >&2
  exit 2
fi

sed -i -e"s/%%SYNAPSE_APP%%/${SYNAPSE_APP}/" /synapse.conf.json
sed -i -e"s/%%SYNAPSE_PORT%%/${SYNAPSE_PORT}/" /synapse.conf.json

if [ "$1" == "run" ];then
  exec /usr/local/bin/synapse -c /synapse.conf.json
fi

eval "$*"

