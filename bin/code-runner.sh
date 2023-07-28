#!/bin/bash

# . /etc/profile.d/modules.sh

rootdir="$(dirname $0)"/..
# . env.sh

httpdir=$VSCODEHUB_RUNTIME_DIR
hubdir=$httpdir/user/$USER/
rm -rf $hubdir
mkdir -p $hubdir

logdir=$HOME/.vscodehub
jobid=$(basename $VSCODEHUB_RUNTIME_DIR)
logfile=$logdir/code-tunnel-$jobid.log
mkdir -p $logdir
ln -s $logfile $hubdir/code-tunnel.log
: > $logfile

sed "s/HOSTNAME/$(hostname -s)/g" $rootdir/share/index.html > $hubdir/index.html

cp $rootdir/bin/code $hubdir/code

$hubdir/code update $VSCODE_ARGS &>> $logfile || true
$hubdir/code tunnel --name="rusty" --accept-server-license-terms $VSCODE_ARGS &>> $logfile &

port="${@#--port=}"
python -m http.server $port --directory=$httpdir &

wait %1
