# Lab 4 - Bash scripting

## Submission Directions
Please submit any required answers and OQE to Canvas. Text answers should be submitted as doc, docx, or pdf. Images should be submitted as jpg or png. Documents should be named **LastName_LabNumber**. For example, Allwine_Lab4.pdf

## Overview
In this lab, you will:
- write several bash scripts
- create schedules using cron and anacron

## Lab Instructions

### Setup

- You will need to install the following packages:
    - whois
    - bind-utils

### Bash Scripts

You are going to create several bash scripts. Each script file should be called **LastName_Script_X** where X is the script number. For example, Peck_Script1 or Allwine_Script2.sh

Skim the man pages for `whois`, `uniq`, `sort`, and `grep`. 

1. Write a script that:
    - searches `/var/log/httpd/access.log` for all IP addresses that accessed your Wordpress site 
    - uses `whois` to determine what country that IP originated from
    - outputs a list of unique countries that accessed your site to a file located in your home directory
2. Write a script that:
    - searches `/var/log/secure` for all users who attempted to ssh to your instance.
    - outputs a unique list of users to a file located in your home directory.
3. Write a script that:
    - searches `/var/log/secure` for all IP addresses that attempted to ssh to your instance
    - outputs a unique list of IP addresses to a file located in your home directory.
    
### Example Commands
- `sudo awk '{print $1}' /var/log/httpd/access.log | sort | uniq`
- `whois -l 93.94.186.228 | grep 'country' | awk '{print $2}'`

### Scheduling with Cron and Anacron

Now you are going to schedule the scripts you've written. Make sure your scripts run successfully before you schedule them.

- Skim the man pages for `cron` and `anacron`
- Schedule script 1 to run daily using cron.
- Schedule script 2 to run weekly using cron.
- Schedule script 3 to run monthly using anacron.


## Questions

There are no questions for this lab.

## OQE

- Submit your script files to Canvas.
- Submit one or more screenshots to Canvas showing each scheduled script.

## Save your lab
- Take a manual snapshot of your lab. 
- Name your snapshot cpsc318-lab4