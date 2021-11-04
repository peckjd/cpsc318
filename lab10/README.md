# Lab 10 - Host Hardening

## Overview
In this lab, you will harden a CentOS 7 Lightsail instance. 

## Lab Instructions

### Setup

- Create a brand new CentOS 7 lightsail instance
- Ensure the instance is completely updated
- Install epel-release, ansible, tmux, wget, and unzip
  - Skim the [tmux](https://linux.die.net/man/1/tmux) man page
  - Read this [RHEL article](https://www.redhat.com/sysadmin/tips-using-tmux) on tips for using tmux

### Fail2Ban

We're going to set up fail2ban to monitor for and mitigate brute force checks and connections.

- Follow this [Digital Ocean Tutorial](https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-centos-7) to set up a Fail2Ban jail for ssh. 
- Towards the end of the tutorial, you are shown how to monitor the fail2ban log file with `tail`
- Use tmux to create a new session for monitoring the fail2ban log file until 1 or more IPs are jailed
  - This may take a while
  - We're using tmux in case the lightsail connection times out
- Take a screenshot showing the log file with jailed IPs. 
- Stop monitoring the log file.

### AIDE

AIDE is an intrusion detection system that is used to monitor for changes made to files and directories.

- Install aide
- Initialize the aide database: `sudo aide --init`
- Move the aide database: `sudo mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz`
- Run an aide check: `sudo aide --check`
  - This check should report that nothing has changed
- Create a test file: `sudo touch /usr/bin/aide-check`
- Run another aide check
- Take a screenshot of the results of the 2nd aide check showing the discovered change
- The next step will configure a daily cron job for running aide checks

### STIGs

DISA publishes [Security Technical Implementation Guides](https://public.cyber.mil/stigs/) which are configuration standards for securing operating systems. We're going to apply the RHEL 7 STIG to our CentOS instance using a DISA provided ansible playbook. 

- `wget https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_RHEL_7_V3R5_STIG_Ansible.zip`
- `unzip U_RHEL_7_V3R5_STIG_Ansible.zip`
- `unzip rhel7STIG-ansible.zip -d rhel7STIG-ansible`

We need to set some custom variables before we can run this playbook.

- Create a file called `custom-vars.yml` in the rhel7STIG-ansible directory
  - Add the following line: `rhel7STIG_stigrule_204496_tmp_mount_Enabled: no`
- Edit `site.yml` so it looks like the following:
```
- hosts: localhost
  gather_facts: no
  vars_files:
    - custom-vars.yml
  roles:
    - rhel7STIG
```
- Run the playbook: `sudo ansible-playbook -v site.yml`


## Submission Instructions

- Submit the fail2ban and aide screenshots as png or jpg files.
- The STIG ansible playbook stores an `xccdf-results.xml` file in `/tmp/tmpXXXXX` where XXXXXX are random characters. Submit this file to canvas.

## Snapshot

- Take a snapshot of this instance after completing this lab.
- Stop the instance
