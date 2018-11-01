FROM gitlab/gitlab-runner:latest

ENV DOCKER_IMAGE "ubuntu:latest"
ENV CI_SERVER_URL "https://gitlab.com/"
ENV RUNNER_NAME "Local runner"
ENV RUNNER_EXECUTOR "docker"
ENV REGISTRATION_TOKEN ""

COPY entrypoint.sh /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT [ "/entrypoint" ]
