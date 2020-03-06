#!/bin/bash

BRANCH_NAME=$1
SHORT_SHA=$2

if [ $BRANCH_NAME = 'spinnaker' ]; then
      docker build . -f src/buildscripts/Dockerfile -t eu.gcr.io/docker-registry/cicd-test-spin:$SHORT_SHA
else
      echo 'Not on spinnaker, skipping Docker step'
fi
