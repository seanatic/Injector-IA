#!/bin/sh
#
# File:   start-on-target.sh
# Author: Fulup Ar Foll @ IoT.bzh
# Object: Forward signal (SIGTERM) to remote process
# Created on 24-May-2017, 09:23:37
# Usage: remote-target-populate update script under ./build directory

# Do not change manually use 'make remote-target-populate'
export RSYNC_TARGET=root@nuc
export PROJECT_NAME=helloworld-binding
export RSYNC_PREFIX=/tmp/helloworld-binding
export AFB_REMPORT=1234

exec ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -tt $RSYNC_TARGET << EOF
    CONTROL_CONFIG_PATH=$RSYNC_PREFIX/etc \
    afb-binder \
	--workdir=$RSYNC_PREFIX \
	--monitoring \
	--port=$AFB_REMPORT \
	--roothttp=./htdocs \
	--ldpaths=./lib \
	--verbose \
	--name $PROJECT_NAME &

    PID_DAEMON=\$!
    trap "echo REMOTE-SIGNAL TRAP; kill -15 \$PID_DAEMON" INT QUIT TERM EXIT
    echo "Target Process Waiting for command"

    # wait for daemon to finish
    wait \$PID_DAEMON
    exit
EOF
