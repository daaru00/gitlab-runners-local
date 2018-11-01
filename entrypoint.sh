#!/bin/bash

gitlab-runner register --non-interactive

gitlab-runner run --user=gitlab-runner --working-directory=/home/gitlab-runner
