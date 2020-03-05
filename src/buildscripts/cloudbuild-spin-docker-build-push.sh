#!/bin/bash

BRANCH_NAME=$1
SHORT_SHA=$2

if [ $BRANCH_NAME = 'spinnaker' ]; then
      docker build . -f src/buildscripts/Dockerfile -t gcr.io/sandpit-environment/github.com/duedil-ltd/cicd-test-spin:$SHORT_SHA
      docker push gcr.io/sandpit-environment/github.com/duedil-ltd/cicd-test-spin:$SHORT_SHA
else
      echo 'Not on spinnaker, skipping Docker step'
fi
