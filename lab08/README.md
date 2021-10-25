# Lab 8 -  Footprinting

## Overview
In this lab, you will use [dig](https://linux.die.net/man/1/dig), [whois](https://linux.die.net/man/1/whois), [nslookup](https://linux.die.net/man/1/nslookup), and [nc](https://linux.die.net/man/1/nc) to perform reconnaissance on remote system(s).

## Lab Instructions

- Read the man pages for dig, whois, nslookup, and nc. 
- Ensure these commands are installed on your system.
- You may need to run `sudo yum provides <command>` to find the correct package(s) to install. 

### Whois

1. Use the `whois` command on `tritiuminc.com` and `peckjd.com`
    - What does the whois command do and why is this important?
    - Who registered the domains?
    - With whom were the domains registered?
    - When were the domains registered?
    - When do the domains expire?

### Dig

2. Use `dig any` on `tritiuminc.com`
    - What type of information was returned?
    - Column 4 of the answer section is the record type. What record types were returned?
    - The MX record with a 0 is the primary MX record because it has the lowest priority. What does this mean?
    - Use `dig any` on the primary MX record. What is the IPv4 address?

3. Use `dig any` on `peckjd.com`
    - How many A records were returned?
    - What can you hypothesize about this domain from the dig results? 
    - Use nslookup on each of the IPv4 addresses in the A records. Who manages them?
    - What can you hypothesize about this domain from the nslookup results?

4. Using the above information, how could you use social engineering to gather more information about these targets?

### Netcat

5. [Modify](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-editing-firewall-rules) your lightsail instance to allow traffic to port 1234. 
    - Open 2 terminals/connections to your lightsail instance. 
    - In the first terminal, run `nc -l -p 12341`
    - In the second terminal run `nc 127.0.0.1 1234` then type `hello, world` and hit Enter/Return
    - What happened? Using the nc man page, what are the -l and -p options?
    - Use ctrl+c to stop both nc commands. 
    - Close terminal 2. 

### Footprinting

6. Run `nc -z -v TRITIUM_MAIL_SERVER_IP 80` where TRITIUM_MAIL_SERVER_IP is the IP you found in question 2.
    - What happened? Use the nc man page to explain what occurred.
    - Run the same command using port 81. What happened? Why do you think this occurred?

7. Run `echo -e "GET / HTTP / 1.0\n\n" nc TRITIUM_MAIL_SERVER 80 | less`
    - What happenend? What information was returned? Do no simply copy and paste the data. Explain what it is. What important pieces of information are included?
    - Check the same IP address with `curl`. What information was returned?

8. Use the same command from question 6 to check ports 15-22. 
    - What ports are open? 
    - Check any open port(s) using curl and the `nc` command from question 7. 
    - What information (if any) was returned?

## Submission Instructions

- You should have answered several questions during steps 1-8. Submit your answers to these questions to Canvas as a doc, docx, txt, or pdf. 

## Snapshot

- You do not need a snapshot for this lab.