# Lab 1 - Lightsail Setup

## Overview
In this lab, you will:
- register for a Red Hat Developer account
- create an Amazon Web Services (AWS)  account
- create a Lightsail instance
- update the instance to the latest operating system version.
- check the update history and enabled repositories

## Lab Instructions
- Join the Red Hat developers program at [developers.redhat.com/register](developers.redhat.com/register). This program provides you with a free Red Hat subscription and access to basic Red Hat support including their knowledgebase, tutorials, documentation, ebooks, and cheat sheets.

-  Sign up for an Amazon Web Services account at [aws.amazon.com](aws.amazon.com).

-  Read through the Amazon Lightsail documentation in the following links. System administration relies on reading documentation and understanding how a service, application, or command works and what options are available to you.
    - [Frequenty Asked Questions in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-frequently-asked-questions-faq)
    - [SSH and Connecting to your Lightsail instance](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/understanding-ssh-in-amazon-lightsail)
    - [Connecting to your Linux or Unix instance in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-how-to-connect-to-your-instance-virtual-private-server)
    - [Connecting to your Linux or Unix instance in Amazon Lightsail using SFTP](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-connecting-to-linux-unix-instance-using-sftp)

    At a minimum, you must understand and be able to answer the following questions:
    - What is Amazon Lightsail?
    - What is a Lightsail instance?
    - What software and operating systems are allowed on Lightsail?
    - How do I connect to a Lightsail instance?
    - What is the difference between stopping and deleting an instance?
    - What are snapshots?
    - How does networking work in Lightsail?
    - How does billing work in Lightsail?

- Use the following instructions and included parameters to create a CentOS 7 lightsail instance.
    - [Launch a Linux Virtual Machine with Lightsail](https://aws.amazon.com/getting-started/hands-on/launch-a-virtual-machine/)

    - Parameters
      - Region: Virginia (us-east-1)
      - Platform: Linux/Unix
      - Blueprint: Click OS Only and select CentOS 7

- Use the following instructions to assign a static IP to your instance
    -  [Create a static IP and attach it to an instance in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-create-static-ip)

- Connect to your instance.

- You need to upgrade your instance to the latest version of CentOS 7 (7.9 as of 2021-08-21). You can check the CentOS version using the following command.

    `cat /etc/redhat-release`

    CentOS uses the yum package manager. You can read the manual for the yum command by issuing the following command.

    `man yum`

    `yum` requires elevated permissions. You are a regular user by default and will need to use `sudo`. For example, `sudo yum [options]`. We will discuss `sudo` and permissions in a future class.

## Submission Instructions

### Questions
- Submit answers to the following questions to Canvas as a doc, docx, txt, or pdf.

1. Upgrade your instance so that it is the latest version of CentOS 7 and all installed packages are at their latest version. What command did you use?

2. Use `yum` to show all of the past yum transactions.  What command did you use?

3. How many packages were out of date when your instance was launched?

4. What `yum` command could you use to show what occurred during a specific yum transaction?

5. Use `yum` to show all of the enabled repositories. What command did you use?

6. How many repositories are enabled?

### Screenshot
- Take a screenshot of your terminal after running the following commands.
    - Clear your terminal using the `clear` command
    - Run the same commands used in questions 2 and 5.
    - Run `cat /etc/redhat-release` to show the CentOS version of your instance.
    - Run the `date` command to show the current date.
- Submit the screenshot to Canvas as a jpg, jpeg, or png.

## Save your lab
- Use the following instructions to create a manual snapshot of your instance
    - [Creating a snapshot of your Linux or Unix instance in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-how-to-create-a-snapshot-of-your-instance)
- Name your snapshot CPSC318-Lab1.
- You **should** snapshot your instance at the end of a lab in case there are questions, comments, or concerns regarding your submission.



