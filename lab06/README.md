# Lab 6 - Ansible Wordpress Installation

## Overview
In this lab, you will create a playbook that will install Wordpress on a CentOS 7 server. 

## Lab Instructions

### Setup

- Create a brand new CentOS 7 lightsail instance
    - **DO NOT** update the instance yet
- Install and enable the EPEL repository
    - `sudo yum install -y epel-release`
    - `sudo yum-config-manager --enable epel`
- Install the following packages: ansible, git
- Use the following commands to check the ansible version and test connectivity
    - `ansible --version`
    - `ansible -m ping localhost`
- Clone the course repository: https://github.com/peckjd/CPSC318
- Change directory to cpsc318/lab6
- There are 2 files in this directory:
    - `update-all.yml` an ansible playbook that updates all packages on a system and installs and enables yum-cron
    - `wordpress.yml` an empty ansible playbook
- Run `ansible-playbook --verbose update-all.yml` to fully update this instance

### Write your playbook
- Use the resources below to modify the `wordpress.yml` playbook so that it:
    - Enables EPEL and Remi's PHP repositories
    - Installs and enables a LAMP stack
    - Installs and configures Wordpress
        - Your playbook will need to install the following packages before you can use the [mysql_user](https://docs.ansible.com/ansible/2.9/modules/mysql_user_module.html) and [mysql_db](https://docs.ansible.com/ansible/2.9/modules/mysql_db_module.html) Ansible modules
          - MySQL-python
          - mysql-connector-python
          - python2-PyMySQL

### Test your playbook 
- Validate your playbook syntax with `ansible-playbook wordpress.yml --syntax-check` 
- Run your playbook in check mode with `ansible-playbook --verbose --check wordpress.yml` 
    - Remember: check mode does not make any changes to the target system(s)

### Execute your playbook
- Run your playbook with `ansible-playbook --verbose wordpress.yml` 
- Open a browser on your personal machine and go to your instance's public IP address. You should be prompted to continue setting up wordress

### Resources
- There are additional resources on Canvas in addition to what is listed here.
- [Ansible Documentation](https://docs.ansible.com/ansible/2.9/modules/modules_by_category.html)
    - Make sure you are using the documentation that matches the installed Ansible version 
    - Use the drop down in the upper left to select 2.9
- Ansible modules you **may** need for this lab
    - [user](https://docs.ansible.com/ansible/2.9/modules/user_module.html)
    - [group](https://docs.ansible.com/ansible/2.9/modules/group_module.html)
    - [package](https://docs.ansible.com/ansible/2.9/modules/package_module.html)
    - [service](https://docs.ansible.com/ansible/2.9/modules/service_module.html)
    - [mysql_db](https://docs.ansible.com/ansible/2.9/modules/mysql_db_module.html)
    - [mysql_user](https://docs.ansible.com/ansible/2.9/modules/mysql_user_module.html)
    - [unarchive](https://docs.ansible.com/ansible/2.9/modules/unarchive_module.html)
    - [copy](https://docs.ansible.com/ansible/2.9/modules/copy_module.html)
    - [synchronize](https://docs.ansible.com/ansible/2.9/modules/synchronize_module.html)
    - [file](https://docs.ansible.com/ansible/2.9/modules/file_module.html)
    - [replace](https://docs.ansible.com/ansible/2.9/modules/replace_module.html)
    - [lineinfile](https://docs.ansible.com/ansible/2.9/modules/lineinfile_module.html)
    - [get_url](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/get_url_module.html)
    - [command](https://docs.ansible.com/ansible/2.9/modules/command_module.html)
    - [shell](https://docs.ansible.com/ansible/2.9/modules/shell_module.html)
- [Lab03 - Enable Repositories for PHP 7.4](https://github.com/peckjd/cpsc318/tree/main/lab03#enable-repositories-for-php-74)
- [Digital Ocean LAMP Install Community tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-centos-7)
- [Digital Ocean Wordpress Install Community tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-centos-7)

## Submission Instructions

- Submit your wordpress playbook to Canvas as a yml file.

## Snapshot

- You do not need a snapshot for this lab.