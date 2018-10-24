# Setup local runners for Gitlab

## Requirement

- [docker](https://docs.docker.com/install/)
- [docker-compose](https://docs.docker.com/compose/install/)

## Retrieve runner registration docker

Go to your repository configuration under "Settings" -> "CI/CD", scroll down until "Set up a specific Runner manually" and you'll see the registration token to provide during setup.

![gitlab-runner-token](https://raw.githubusercontent.com/daaru00/gitlab-runners-local/master/doc/gitlab-runner-token.png)

## Configure local environment

Clone this repository and copy `docker-compose.example.yml` to `docker-compose.yml`

```bash
git clone git@github.com:daaru00/gitlab-runners-local.git
cd gitlab-runners-local
cp docker-compose.example.yml docker-compose.yml
```

Edit `docker-compose.yml` file adding runner for each your repository changing only, service name, container name and `REGISTRATION_TOKEN` environment variable
```yml
version: '3'
services:
  project1:
    build: .
    container_name: "gitlab-runner-project1" #change this with your repository name
    environment: 
      REGISTRATION_TOKEN: "<registration token here>" #add repository-specific registration token
    volumes:
     - /var/run/docker.sock:/var/run/docker.sock

  project2:
    build: .
    container_name: "gitlab-runner-project2" #change this with your repository name
    environment: 
      REGISTRATION_TOKEN: "<registration token here>" #add repository-specific registration token
    volumes:
     - /var/run/docker.sock:/var/run/docker.sock
```

## Run

Inside the project root directory run
```bash
docker-compose up -d
```

## Check if runner works

Go to your repository "CI/CD Settings" (same configuration page described above), you should see you runner connected

![gitlab-runner-connected](https://raw.githubusercontent.com/daaru00/gitlab-runners-local/master/doc/gitlab-runner-connected.png)

## Show runner logs

Inside the project root directory run
```bash
docker-compose logs project1
```
