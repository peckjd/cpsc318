# Lab 3 - Manual Wordpress Installation

## Overview
In this lab, you will:
- Install a LAMP stack
- Install Wordpress
- Create and modify a kickstart file

## Lab Instructions

### Enable repositories for PHP 7.4
A LAMP stack (Linux, Apache, MySQL, and PHP) is a common web development software stack. CentOS 7 installs PHP 5.4, which is [no longer supported by Wordpress](https://displaywp.com/wordpress-minimum-php-version/). We're going to use Remi's Repository, which is run by a PHP packager.

- Install the Extra Packages for Enterprise Linux (EPEL) Repository: `sudo yum install -y epel-release`
- Install Remi's Repository: `sudo yum install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm`
- Enable EPEL and Remi's 7.4 repositories: `sudo yum-config-manager --enable epel remi-php74`
- Check that both repositories are enabled: `sudo yum repolist enabled`

### Install a LAMP stack

- Install a LAMP stack using this [Digital Ocean Community tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-centos-7)
    - Your public IP address is the static IP you assigned to your instance in lab 1.
    - Make sure you remember your secure mysql password. You will need it later.
    - You do not need to create the example_database or example_user in *Step 2 - Installing MySQL (MariaDB)*
    - You do not need to complete *Step 5 - Testing Database Connection with PHP (Optional)*

### Install Wordpress

- Install Wordpress using this [Digital Ocean Community tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-centos-7)

### Create and modify a kickstart file

Kickstart files help administrators perform automated installations. We're going to generate a kickstart for your newly created LAMP server.

- Install the kickstart package: `sudo yum install system-config-kickstart`
- Generate a kickstart file: `sudo system-config-kickstart --generate lightsail-kickstart`
- Change ownership on `lightsail-kickstart` from root to centos.

The default timezone is UTC. We want our new servers to default to Eastern Time.
- See the current system time information: `timedatectl`
- List all system timezones: `timedatectl list-timezones`
- Modify your kickstart to use an east coast time zone.

Set the default root password
- Use the following python to generate a sha512 crypt compatible hash: `python -c 'import crypt,getpass;pw=getpass.getpass();print(crypt.crypt(pw) if (pw==getpass.getpass("Confirm: ")) else exit())'`
- Add the password hash to your kickstart file by replacing `rootpw --iscrypted !!` with `rootpw --iscrypted [hash]` where `[hash]` is the password hash generated in the previous step.

## Submission Directions
### Questions
- Submit answers to the following questions to Canvas as a doc, docx, txt, or pdf file.
1. Were you able to see the default Apache configuration page after you started the Apache service? Why or why not?
2. Using the [Lightsail website](https://lightsail.aws.amazon.com/), what services are enabled by default in your instance's firewall?
3. What is the public IP for your wordpress site?

### Kickstart

- Submit your kickstart to Canvas as a plain text file

## Save your lab
- Take a manual snapshot of your lab.
- Name your snapshot cpsc318-lab3