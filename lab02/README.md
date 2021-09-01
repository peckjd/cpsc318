# Lab 2 - Users and Permissions

## Submission Directions
Please submit any required answers and OQE to Canvas. Text answers should be submitted as doc, docx, or pdf. Images should be submitted as jpg or png. Documents should be named **LastName_LabNumber**. For example, Allwine_Lab2.pdf

## Overview
In this lab, you will:
- Install and configure yum-cron
- Modify dot files
- Manually create users and groups
- Modify default user preferences

## Lab Instructions
### Install and configure yum-cron
- Install yum-cron: `sudo yum install yum-cron`
- Edit `/etc/yum/yum-cron.conf` with your preferred editor (nano, vi, vim, emacs, etc)
    - change `apply_updates = no` to `apply_updates = yes`
    - Save the file and close your editor
- Enable the yum-cron service: `sudo systemctl enable yum-cron.service`
- Start the yum-cron service: `sudo systemctl start yum-cron.service`
- Check the status of yum-cron: `systemctl status yum-cron.service`
- **OQE**: Take a screenshot of your terminal. It must show the results of the status command.

### Modify your user preferences
Your home directory contains configuration files (known as dot files because the filename starts with a '.') that you can modify to tailor a system to your preferences. By default CentOS/RHEL uses the [bash](https://www.gnu.org/software/bash/) shell and it can be customized using the .bashrc file. 
- Make sure you are in your home directory: `cd ~`
- Backup your .bashrc file: `cp .bashrc bashrc.bak`
- Install [liquidprompt](https://github.com/nojhan/liquidprompt) using their [instructions for shell installation](https://liquidprompt.readthedocs.io/en/stable/install.html)
    - You may need to install git: `sudo yum install git`
    - Clone the repository
    - Install it locally by modifying your .bashrc file
- Reload your current shell from your new .bashrc file: `source ~/.bashrc`
- Notice how your bash prompt changed.
- **OQE** Take a screenshot of your terminal showing your new bash prompt
- **QUESTIONS**
    1. What are the permissions of your .bashrc file?
    2. Who has permission to edit this file?
    3. Who has permission to read this file?

### Managing users and groups
Normally, workstations and servers are joined to a domain that manages user and group creation. We do not have a domain and are going to manually create several users and groups during this lab. 

- Skim the man pages for `useradd`, `passwd`, and `su`
- Create the cpsc318 user: `sudo useradd cpsc318`
- Create a password for cpsc318: `sudo passwd cpsc318`
- Check the running user (it should be centos): `whoami`
- Switch to the cpsc318 user: `su - cpsc318`
- Check the running user (it should be cpsc318): `whoami`
- Use one of the following to exit this shell:
    - `exit`
    - `logout`
    - ctrl+d
- Check the running user (it should be centos): `whoami`

### Modify default user preferences
The `/etc/skel` directory contains files that are copied to a user's home directory during account creation. You can change these files to ensure that all users start with the same environment. 
- Navigate to the skel directory: `cd /etc/skel`
- Copy your modified bashrc: `sudo cp ~/.bashrc .`

### Create additional users and groups
- Skim the man pages for `groupadd`, `usermod`, and `groups`
- Create a user for Joel: `sudo useradd joel`
- Create a user for Kenny: `sudo useradd kenny`
- Create a umw group: `sudo groupadd umw`
- Add Joel to umw: `sudo usermod -a -G umw joel`
- Add Kenny to umw: `sudo usermod -a -G umw kenny`
- View Joel's groups: `groups joel`
- View Kenny's groups: `groups kenny`
- View cpsc318's groups: `groups cpsc318`
- **OQE** Take a screenshot of your terminal showing the output of all 3 `groups` commands.

### Check user environments
- Switch to the Kenny user: `su - kenny`
- **QUESTION** What happened?
- Switch to the Kenny user: `sudo su - kenny`
- **QUESTION** Did you notice anything different with this login versus cpsc318? Why?
- Use one of the following to exit this shell:
    - `exit`
    - `logout`
    - ctrl+d
- Check the running user (it should be centos): `whoami` 

## File Permissions
- Skim the man pages for `touch`, `chmod`, and `chown`
- Make sure you are in your home directory: `cd ~`
- Create a new file: `touch lab2`
- Check the default permissions: `ls -l lab2`
- **QUESTION** What are the default permissions for your newly created lab2 file?
- Change permissions on lab2: `chmod 0600 lab2`
- **QUESTION** Who has permission to access this file?
- Copy this file to /opt: `cp lab2 /opt`
- **QUESTION** What happened? Why?
- Copy this file to /opt: `sudo cp lab2 /opt`
- Read the file you just copied: `cat /opt/lab2`
- **QUESTION** What happened? Why?
- Change ownership on the copied file: `sudo chown centos /opt/lab2`
- Read the copied file: `cat /opt/lab2`
- **QUESTION** What are the new permissions on /opt/lab2?

## Save your lab
- Take a manual snapshot of your lab. 
- Name your snapshot cpsc318-lab2