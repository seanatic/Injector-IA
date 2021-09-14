#!/bin/sh
#
# File:   install-wgt-on-target.sh
# Author: Sebastien Douheret @ IoT.bzh
# Object: install widget on target
# Created on 24-May-2017, 09:23:37
# Usage:

# Do not change manually use 'make remote-target-populate'
export RSYNC_TARGET=root@nuc
export WGT_FILE_L=/home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/helloworld-binding.wgt
export WGT_FILE_T=/tmp/helloworld-binding.wgt

scp $WGT_FILE_L $RSYNC_TARGET:$WGT_FILE_T \
    && ssh -o "StrictHostKeyChecking no" -tt $RSYNC_TARGET -- \
        afm-util install $WGT_FILE_T

#    && rm -f $WGT_FILE_T

