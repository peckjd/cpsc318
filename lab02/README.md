# Lab 2 - Users and Permissions

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
- **QUESTIONS 1-3**
    - What are the permissions of your .bashrc - file?
    - Who has permission to edit this file?
    - Who has permission to read this file?

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

### Check user environments
- Switch to the Kenny user: `su - kenny`
- **QUESTION 4** What happened?
- Switch to the Kenny user: `sudo su - kenny`
- **QUESTION 5** Did you notice anything different with this login versus cpsc318? Why?
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
- **QUESTION 6** What are the default permissions for your newly created lab2 file?
- Change permissions on lab2: `chmod 0600 lab2`
- **QUESTION 7** Who has permission to access this file?
- Copy this file to /opt: `cp lab2 /opt`
- **QUESTION 8** What happened? Why?
- Copy this file to /opt: `sudo cp lab2 /opt`
- Read the file you just copied: `cat /opt/lab2`
- **QUESTION 9** What happened? Why?
- Change ownership on the copied file: `sudo chown centos /opt/lab2`
- Read the copied file: `cat /opt/lab2`
- **QUESTION 10** What are the new permissions on /opt/lab2?

## Submission Instructions

### Questions
- You should have answered 10 questions while completing this lab. Submit your answers to Canvas as a doc, docx, txt, or pdf. 

### Screenshot
- Take a screenshot of your terminal after running the following commands. 
    - Make sure you are the centos user and that your bash prompt is showing the default liquidprompt.
    - Clear your terminal using the `clear` command
    - Run `sudo systemctl status yum-cron.service`
    - Run `cat /etc/skel/.bashrc`
    - Run `groups joel; groups kenny; groups cpsc318`
    - Run the `date` command to show the current date.
- Submit your screenshot to Canvas as a jpg, jpeg, or png.

## Save your lab
- Take a manual snapshot of your lab. 
- Name your snapshot cpsc318-lab2