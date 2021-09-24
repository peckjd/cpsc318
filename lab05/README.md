# Lab 5 - Scripted Wordpress Installation

## Submission Directions
Please submit any required answers and OQE to Canvas. Text answers should be submitted as doc, docx, or pdf. Images should be submitted as jpg or png. Documents should be named **LastName_LabNumber**. For example, Peck_Lab5.pdf

## Overview
In this lab, you will:
- Write a bash script that installs a LAMP stack and wordpress
- Launch a Lighstail instance that runs your script during creation

## Lab Instructions

### Write your script

Create a bash script that will:
- Update all installed packages
- Install EPEL and Remi's PHP repositories
- Install a LAMP stack
- Install Wordpress

Helpful Hints
- Use `mysql -u root -e <command>` to execute database commands
- Use `sed` to edit wp-config.php
- You **do not** need to run `mysql_secure_installation`. 
    - This will leave the default root password blank. 
    - This is incredibly insecure, but these are shortlived instances used as examples.
- We recommend creating a new lightsail instance so you can periodically test your script as you develop it.

Reference:
- [Lab03 - Enable Repositories for PHP 7.4](https://github.com/peckjd/cpsc318/tree/main/lab03#enable-repositories-for-php-74)
- [Digital Ocean LAMP Install Community tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-centos-7)
- [Digital Ocean Wordpress Install Community tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-centos-7)

### Launch Wordpress

- Log in to [Lightsail](https://lightsail.aws.amazon.com/)
- Click **Create Instance**
- Make the following selections:
    - Linux/Unix
    - OS Only
    - CentOS 7 2009-01
- Click **+Add launch Script**
- Paste your bash script into the text box
- Click **Create Instance**
- The new instance will launch. 
- Connect and monitor the installation using methods discussed in class
    - `top`, `htop`, `ps`, `journalctl`, etc
    - You can also monitor /var/log/messages
- After completion, open a browser and go to the new instance's IP. You should see the wordpress configuration page

## Questions

- There are no questions for this lab.

## OQE

- Submit your bash script to Canvas.

## Save your lab

- You do not need a snapshot for this lab.