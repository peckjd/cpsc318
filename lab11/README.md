# Lab 11 - Vulnerability Management

## Overview
In this lab, you will use well known tools to scan for vulnerabilities and configuration settings in the hardened instance you created in lab 10. 

## Lab Instructions

### Setup

- Start the lightsail instance you hardened in lab 10.
  -  Stop the fail2ban service otherwise it will ban your scanner.
- We are going to use Docker to deploy a Nessus scanner. Either:
  - start a 2nd lightsail instance configured with docker OR
  - download Docker Desktop on your personal system
- Review the [Tenable for Education Instructor/Student Guide](https://static.tenable.com/marketing/whitepapers/Guide-Tenable-for-Education.pdf)

### Nessus

#### Set up the Scanner

- [Register](https://www.tenable.com/tenable-for-education/nessus-essentials) for a Nessus Essentials Activation Code
- Use git to clone the [course repository](https://github.com/peckjd/cpsc318)
- Go to the lab 11 directory
- Create an .env file using the included template, .env-template
  - You *should never* commit populated .env files.
- Edit the newly created .env file and add a username, password, and your Nessus Activation Code
- Start the nessus container using docker-compose
- If you're running docker on Lightsail, go to lightsail.aws.com and modify your instance's firewall to allow https access to port 8834 

#### Create a Nessus Scan
- Open a browser and go to the Nessus UI. Nessus defaults to using a self signed certificate. You will need to accept the warning in your browser in order to proceed.
  - Using Docker Desktop: `https:\\localhost:8834`
  - Using Lightsail: `https:\\<lightsail IP>:8834`
- Log in to Nessus using the username and password you saved in the .env file
- If prompted, cancel the host discovery scan.
- Click **New Scan** in the upper right corner
- Click **Basic Network Scan**
- Enter `Lab 11 - <Last Name>` in the **Name** field
- Enter the IP for your hardened lightsail instance in the **Targets** field
- Select the **Credentials** tab
- Click **SSH**
- Set the **Authentication method** to `public key`
- Enter `centos` in the **Username** field
- Click **Add File** and add your private key.
  - You can download a copy of your private key from https://lightsail.aws.amazon.com/ls/webapp/account/keys
- Set **Elevate Privileges with** to `sudo`
- Enter `centos` in the **sudo user** field
- Click the **Save** button

#### Lauch your Nessus scan and export a report

- Click **My Scans** if you are not automatically taken there after saving your scan.
- Select the scan you created earlier
- Click the **Launch** dropdown and select **default**
  - This scan will take a few minutes to complete
- After the scan completes, click **Report**
- Select **Detailed Vulnerabilities by Host**
- Click **Generate Report**
- Close your browser

### SCAP

We are now going to use DISA's [SCAP Compliance Checker](https://public.cyber.mil/stigs/scap/) to check the configuration state of your hardened instance.

#### Install the SCC tool

- Connect to your hardened instance using SSH. 
- Download the scap tool: `wget https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/scc-5.4.2_rhel7_sles12-15_oracle-linux7_x86_64_bundle.zip`
- `unzip scc-5.4.2_rhel7_sles12-15_oracle-linux7_x86_64_bundle.zip`
- `cd scc-5.4.2_rhel7_x86_64`
- `sudo yum -y --nogpgcheck localinstall scc-5.4.2.rhel7.x86_64.rpm`

#### Configure and run a scan

- `sudo /opt/scc/cscc --config`
- Choose menu option 1: Configure SCAP content
- Disable all content except for RHEL 7
- Return to the main configuration menu
- Choose menu option 6: Configure Options
- Choose menu option 1: Scanning Options
- Enable option 3: Run all SCAP content regardless of applicability
- Return to the main configuration menu
- Choose menu option 9: Exit, save changes, and perform scan of local computer
  - This scan will take a few minutes to complete.
- The scc tool places results in `$HOME/SCC/Sessions/<time stamp>/Results/SCAP`

## Submission Instructions

- Submit your Nessus Report and the 2 SCAP html result files to Canvas

## Snapshot

- Stop your Lightsail instance(s) and your nessus container
