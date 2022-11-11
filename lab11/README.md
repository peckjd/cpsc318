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

- [Register](https://www.tenable.com/tenable-for-education/nessus-essentials) for a Nessus Essentials Activation Code using your UMW email address and entering `University of Mary Washington` for the organization.
- Use git to clone the [course repository](https://github.com/peckjd/cpsc318)
- Go to the lab 11 directory
- Start the nessus container using `docker compose up -d`
- If you're running docker on Lightsail, go to lightsail.aws.com and modify your instance's firewall to allow https access to port 8834 
- Open a browser and go to the Nessus UI. Nessus defaults to using a self signed certificate. You will need to accept the warning in your browser in order to proceed.
  - Using Docker Desktop: `https://localhost:8834`
  - Using Lightsail: `https://<lightsail IP>:8834`
- Select **Nessus Essentials** and click **Continue**
- Click **Skip**
- Enter the activation code you received in your email during registration and click **Continue**
- Create a user and click **Submit**
- Wait for Nessus to download and compile its plugins
  - The site will refresh after a few minutes and show a notification stating `Plugins are compiling. Nessus functionality will be limited until compilation is complete`
  - This can take a while depending on how many resources are allocated to the container
  - You will see a notification stating `Plugins are done compiling` when this task finishes.

#### Create a Nessus Scan
- If prompted, cancel the host discovery scan.
- Click the blue **New Scan** button in the upper right of the webpage 
  - If you don't see this button, click **Scans** in the menu bar
  - The button will be disabled until the plugins are done compiling
- Click **Basic Network Scan**
- Enter `Lab 11 - <Last Name>` in the **Name** field
- Enter the public IP for the lightsail instance you hardened in lab 10 in the **Targets** field
- Select the **Credentials** tab
- Click **SSH**
- Set the **Authentication method** to `public key`
- Enter `centos` in the **Username** field
- Click **Add File** and add your private key.
  - You can download a copy of your private key from https://lightsail.aws.amazon.com/ls/webapp/account/keys
- Set **Elevate Privileges with** to `sudo`
- Enter `centos` in the **sudo user** field
- Click the **Save** button

#### Lauch your Nessus scan

- Click **My Scans** if you are not automatically taken there after saving your scan.
- Select the scan you created earlier
- Click the **Launch** button in the upper right of the webpage
- The page will switch to the **History** tab 
  - The status column will show **Running**
  - This scan will take a several minutes to complete

#### Export a scan report
- After the scan completes, click **Report**
- Select `PDF` for **Report Format**
- Select `Detailed Vulnerabilities by Host` for **Report Template**
- Click **Generate Report**
  - A sample report can be found in the course repository
- Close your browser

### SCAP

We are now going to use DISA's [SCAP Compliance Checker](https://public.cyber.mil/stigs/scap/) to check the configuration state of your hardened instance.

#### Install the SCC tool

- Connect to your hardened instance using SSH. 
- Download the scap tool: `wget https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/scc-5.6_rhel7_sles12-15_oracle-linux7_x86_64_bundle.zip`
- `unzip scc-5.6_rhel7_sles12-15_oracle-linux7_x86_64_bundle.zip`
- `cd scc-5.6_rhel7_x86_64`
- `sudo yum -y --nogpgcheck localinstall scc-5.6.rhel7.x86_64.rpm`

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
  - You will submit the 2 HTML reports.
  - There are sample reports in course git repository

## Submission Instructions

- Submit your Nessus Report and the 2 SCAP html result files to Canvas

## Snapshot

- Stop your Lightsail instance(s) and your nessus container
