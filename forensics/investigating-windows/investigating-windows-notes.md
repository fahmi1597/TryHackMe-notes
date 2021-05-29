# TryHackMe - Investigating Windows

<fieldset>

<legend>Room Information </legend>

- **Name:**  Investigating Windows
- **Category:** Forensics
- **Difficulty:** 
- **Tools:**
  - Windows default utilities
- **Skills Learned**:
  - Windows Forensics

</fieldset>

## Description

> A windows machine has been hacked, its your job to go investigate this  windows machine and find clues to what the hacker might have done.

---

## Task 1: Investigating Windows

Available users 

![image-20210528004612115](_resources/image-20210528004612115.png)

Last logon of user Jenny is never. Jenny is an Administrator

![image-20210528004833153](_resources/image-20210528004833153.png)

Last logon of user John is 3rd February 2019 (3/2/2019).

![image-20210528004909629](_resources/image-20210528004909629.png)

Last logon of user Administrator is today (27th May 2021)

![image-20210528005050183](_resources/image-20210528005050183.png)

There is also a Guest account, which surprisingly an Admin

![image-20210528005326866](_resources/image-20210528005326866.png)

There is a malicious task opening a bind shell on port 1348 using netcat version of PowerShell.

![image-20210528005732787](_resources/image-20210528005732787.png)

There is a malicious task harvesting logon password. Judging from the syntax, it can be `mimikatz`.

![image-20210528005642446](_resources/image-20210528005642446.png)

According to the event logger, there is no log from 2020. The logs start from 3/2/2019.

![image-20210528012336368](_resources/image-20210528012336368.png)

![image-20210528010534393](_resources/image-20210528010534393.png)

Digging into app and services logs, there is a RDP session from 88.104.10.206

![image-20210528013126452](_resources/image-20210528013126452.png)

The attacker uses TMP folder in C:\ to store data

![image-20210528011409839](_resources/image-20210528011409839.png)

The computers trying to connect to `20.54.89.106` on port 443.

![image-20210528011831114](_resources/image-20210528011831114.png)

The DNS has been poisoned

![image-20210528015650814](_resources/image-20210528015650814.png)

With dig, I can verify that IP is not Google's IP.

![image-20210528015500826](_resources/image-20210528015500826.png)

There is also interesting Firewall rules that allows inbound connection on port 1337

![image-20210528020042488](_resources/image-20210528020042488.png)



---

## Commands log

Cmd

```
systeminfo
net users
net user [username]
netstat -ano
ipconfig /displaydns
```



PowerShell

```
Get-WmiObject -Class Win32_OperatingSystem
Get-WmiObject -Class win32_UserAccount
```

