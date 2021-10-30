# Lab 9 - Portscanning

## Overview
In this lab, you will use [nmap](https://nmap.org/) to scan a remote system.

## Lab Instructions

### Setup

- Familiarize yourself with the nmap [man page](https://linux.die.net/man/1/nmap) and [reference guide](https://nmap.org/book/man.html). 
- Ensure nmap is installed on your lightsail instance.
- **Note**
You should use the IP address of the target system(s) instead of the domain name.
- If you get a message saying the host is down, try adding the `-Pn` flag before the IP address 

### Port Scans

- For questions 1-9
    - Take a screenshot of your terminal that includes both your command and the output.
    - Explain the results that nmap returned
    - Answer the following questions in paragraph form for each nmap scan
        - How did nmap get these results?
        - Why would you use this type of scan?
- **Note** Your answers will never be "No open ports"
- Questions 8 and 9 have additional questions you need to answer.
- **Do not** run the scan in question 10.

1. Perform a SYN scan on mail.tritiuminc.com. 

2. Perform a connect scan on mail.tritiuminc.com. 

3. Perform a UDP scan on mail.tritiuminc.com. Include the flag `-F --version intensity 0` (this may take a while). 

4. Perform a FIN scan on mail.tritiuminc.com. 

5. Perform a NULL scan on mail.tritiuminc.com. 

6. Perform an XMAS scan on mail.tritiuminc.com

7. Perform an ACK scan on mail.tritiuminc.com

8. Perform an enumeration scan on mail.tritiuminc.com that attempts to determine the server's operating system. How could you as a network defender try and trick someone using nmap to enumerate a system?

9. Perform an enumeration scan on a willing participant's Lightsail instance. Were the results correct? Explain why or why not.

10. What command _could_ we use to scan an entire network? **Do Not** execute the command. Why would we want to scan an entire network? What information could we gather?

## Submission Instructions

- You should have answered several questions during this lab. Submit your answers to these questions to Canvas as a doc, docx, txt, or pdf. 
- Do not submit the screenshots separately. They should be embedded in your submission document.

## Snapshot

- You do not need a snapshot for this lab.
