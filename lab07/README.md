# Lab 7 -  Wordpress Containers

## Submission Directions
Please submit any required answers and OQE to Canvas. Text answers should be submitted as doc, docx, or pdf. Images should be submitted as jpg or png. Documents should be named **LastName_LabNumber**. For example, Peck_Lab7.pdf

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
- Use docker-compose to start a Wordpress application stack
    - Use the example stack.yml file for wordpress from https://hub.docker.com/_/wordpress
    - Expose Wordpress on port 80 otherwise you will need to modify your Lighstail instance's firewall.
    - Use a browser to make sure wordpress is reachable on localhost or your Lightsail instance's public IP
- Modify your wordpress docker-compose file to add healthchecks for both containers (app and db)
    - The Compose file reference is https://docs.docker.com/compose/compose-file/
    - You will need to restart the containers using docker-compose after adding the health checks
        - `docker-compose up -d` or `docker-compose up -d --force-recreate`


## Questions

- There are no questions for this lab

## OQE

- Submit your wordpress docker-compose file to Canvas.
    - Include a link to your docker hub profile as a comment
- Submit an additional document comparing and contrasting the 4 installation techniques we've used for installing Wordpress: manually, scripted with Bash, configuration management with Ansible, and using containers. Include scenarios where a system administrator might choose to implement each option or a hybrid of 2 or more approaches. 
    - This document must be at least 250 words in length. 

## Snapshot

- You do not need a snapshot for this lab.