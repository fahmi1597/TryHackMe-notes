# TryHackMe - Pickle Rick

A Rick and Morty CTF. Help turn Rick back into a human!

## Skills Learned

- Common enumeration 
  - Inspecting Page Sources
  - Directory Brute Force
- Use of alternative binary to read file content

# Tasks

## Pickle Rick

### Identify Web technologies

- Web server: apache
- Language used: php
- Host: Ubuntu

![0f5120880538a5288fafb8d472bd36c2.png](./_resources/110c9bf494a1466ab370695b5a07502f.png)

### Inspection Page Source

Undeleted comment on HTML codes.

![ad5a79a65ee60c9fcaa8d32d74484165.png](./_resources/2874c8ffc030452196bd87321e69e0fc.png)

### Directory Brute Force

Finding hidden web path/directory

```bash
gobuster dir -u http://10.10.240.27/ -w raft-large-directories.txt -x php,html,txt -t 20
```

![af1d462c3da8cbef29b65056fae4cf54.png](./_resources/f4976eae470c4d8ca9810b7428a5d842.png)

```bash
$ curl -s http://10.10.240.27/robots.txt
Wubbalubbadubdu
```



### Access on `/portal.php`

`R1ckRul3s:Wubbalubbadubdub`


![7806e0f6a49985e2c672ad65716c9530.png](./_resources/075bde3fdb274d8d84d1cfd70177931e.png)

![8dc66674b2d3d5ae717dcb7024a5e123.png](./_resources/096a4490c7064651b78c10134b657d32.png)

![97ecd421efd62d982202ac48ed694a9d.png](./_resources/975b7351421649608f2f241621b33216.png)

![fbd25629039422ba961bf281ba7f0dc6.png](./_resources/5772e38c444140c6a1f477fef76dcd39.png)


![eec8679ca0e9681af94f984fe111436d.png](./_resources/5d32504093fc495db32d479d2c89f24b.png)

![ee5881b0dbc7f37f8b61c7a2a7a0abef.png](./_resources/e138a8e28eb4442eb8d7a82312fb5bb6.png)

![484e2931d6fb8668514805da71ae3fe3.png](./_resources/dc7660b233e24e65bc50071eac286dd8.png)

![2b7b24ba7a5b4f46355846791461cbc1.png](./_resources/f7f9ffd469a54ccda6f6a57ed5e4e49a.png)