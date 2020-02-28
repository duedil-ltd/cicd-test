#!/bin/bash

BRANCH_NAME=$1
SHORT_SHA=$2

if [ $BRANCH_NAME = 'master' ]; then
      docker build . -f src/buildscripts/Dockerfile -t gcr.io/sandpit-environment/github.com/duedil-ltd/cicd-test:$SHORT_SHA
      docker push
else
      echo 'Not on master, skipping Docker step'
fi
