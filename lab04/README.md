# Lab 4 - Bash scripting

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

You are going to create several bash scripts. Each script file should be called **scriptX.sh** where X is the script number. For example, script01.sh or script2.sh

Skim the man pages for `whois`, `uniq`, `sort`, and `grep`.

1. Write a script that:
    - searches `/var/log/httpd/access_log` for all IP addresses that accessed your Wordpress site
    - uses `whois` to determine what country that IP originated from
    - outputs a list of unique alphabetically sorted countries that accessed your site to a file located in your home directory
2. Write a script that:
    - searches `/var/log/secure` for all users who attempted to ssh to your instance.
    - outputs a unique list of reverse alphabetically sorted users to a file located in your home directory.
3. Write a script that:
    - searches `/var/log/secure` for all IP addresses that attempted to ssh to your instance
    - uses `whois` to determine what country that IP originated from
    - outputs a unique list of IP addresses and associated country to a file located in your home directory.
        - IP addresses and countries should be separated by a comma: e.g `8.8.8.8,US`

### Example Commands
- `sudo awk '{print $1}' /var/log/httpd/access_log | sort | uniq`
- `whois -l 8.8.8.8 | grep 'country' | awk '{print $2}'`

### Scheduling with Cron and Anacron

Now you are going to schedule the scripts you've written. Make sure your scripts run successfully before you schedule them.

- Skim the man pages for `cron` and `anacron`
- Schedule script 1 to run daily using cron.
- Schedule script 2 to run weekly using cron.
- Schedule script 3 to run monthly using anacron.

## Submission Instructions

- Submit your script files and any output files you use to Canvas.
    - The script files must be in plain text
    - Any output files must be plain text files
- Submit one or more screenshots to Canvas showing each scheduled script.
    - Each screenshot should be a jpg, jpeg, or png file.

## (Optional) Save your lab
- Take a manual snapshot of your lab.
- Name your snapshot cpsc318-lab4