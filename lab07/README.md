# Lab 7 -  Wordpress Containers

## Overview
In this lab, you will practice using containers and then use docker-compose to publish Wordpress.

## Lab Instructions

### Setup
- Follow the [official instructions](https://docs.docker.com/engine/install/) to install Docker Engine on either your person laptop or desktop or a Lightsail instance
- **Lightsail/Linux only** Add your user to the docker group to avoid needing to sudo every docker command
    - `sudo usermod -a -G docker <username>`
    - Log out and back in so the user's groups are updated
- Test docker with the hello-world container `docker run --rm hello-world`

### Docker Tutorial
- Start the Docker [getting-started](https://github.com/docker/getting-started) tutorial
    - `docker run -d -p 80:80 docker/getting-started`
    - Use a browser to access the tutorial on either localhost or your instance's public IP
- Complete the getting-started tutorial
    - Make sure you stop any running containers after you finish

### Containerize Wordpress
- Clone the course repository: https://github.com/peckjd/CPSC318
- Use docker-compose to start a Wordpress application stack using the docker-compose.yml file in the lab07 directory
    - `docker-compose up -d` 
    - **Lightsail/Linux only** Change the wordpress port to 80 otherwise you will need to modify your Lighstail instance's firewall.
    - Use a browser to make sure wordpress is reachable on localhost or your Lightsail instance's public IP
- Modify the docker-compose.yml wordpress file to add healthchecks for both the app and db containers
    - A health check is used to determine if a running container is in a healthy state. In our case, we should check to see if our wordpress container is correctly publishing a website and that our db container has a running database.
    - The Compose file reference is https://docs.docker.com/compose/compose-file/
    - You will need to restart the containers using docker-compose after adding the health checks
        - `docker-compose up -d` or `docker-compose up -d --force-recreate`

## Submission Instructions

- Submit your wordpress docker-compose file to Canvas as a yml file.
    - Include a link to your docker hub profile as a comment
    - You created this profile during the *Sharing Our App* section of the Docker tutorial and should take the form `https://hub.docker.com/u/USERNAME` where USERNAME is your username.
- Submit an additional document comparing and contrasting the 4 installation techniques we've used for installing Wordpress: manually, scripted with Bash, configuration management with Ansible, and using containers. Include scenarios where a system administrator might choose to implement each option or a hybrid of 2 or more approaches. 
    - This document must be at least 250 words in length
    - This document must be a doc, docx, txt, or pdf file.

## Snapshot

- You do not need a snapshot for this lab.