#!/bin/bash

#echo "the build start! The payload is $payload"

pwd

TARGET_DIR=`echo $payload | jq -r '.repository.name'`
echo $TARGET_DIR

cd $TARGET_DIR
pwd

git fetch origin

BRANCH=`echo $payload| jq -r '.ref'|sed "s/refs\/heads\///"`
echo "branch is $BRANCH"
git reset --hard origin/${BRANCH}
