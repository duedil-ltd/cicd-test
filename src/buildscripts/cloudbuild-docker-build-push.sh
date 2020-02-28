#!/bin/bash

BRANCH_NAME=$1
SHORT_SHA=$2

if [ $BRANCH_NAME = 'feat-fix-docker-pull' ]; then
      docker build . -f src/buildscripts/Dockerfile -t gcr.io/sandpit-environment/github.com/duedil-ltd/cicd-test:$SHORT_SHA
      docker push gcr.io/sandpit-environment/github.com/duedil-ltd/cicd-test:$SHORT_SHA
else
      echo 'Not on master, skipping Docker step'
fi
