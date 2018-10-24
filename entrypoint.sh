#!/bin/bash

if [ ! -f /etc/gitlab-runner/config.toml ]; then
    gitlab-runner register --non-interactive
fi

gitlab-runner run --user=gitlab-runner --working-directory=/home/gitlab-runner
