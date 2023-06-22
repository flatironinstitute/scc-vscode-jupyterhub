#!/bin/bash

# . /etc/profile.d/modules.sh

rootdir="$(dirname $0)"/..
# . env.sh

httpdir=/dev/shm/$SLURM_JOB_ID/
hubdir=$httpdir/user/$USER/
rm -rf $hubdir
mkdir -p $hubdir

sed "s/HOSTNAME/$(hostname -s)/g" $rootdir/share/index.html > $hubdir/index.html

cp $rootdir/bin/code $hubdir/code

unset "${!SLURM_@}"

$hubdir/code tunnel --name="rusty" --accept-server-license-terms &> $hubdir/code-tunnel.log &

port="${@#--port=}"
python -m http.server $port --directory=$httpdir &

wait %1
