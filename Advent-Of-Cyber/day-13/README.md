# Day 13 | Coal for Christmas

`TryHackMe` `Dirty COW` `CVE-2016-5195` `Privilege Escalation`

---

## Learning Outcomes

Hasil pembelajaran
- Pendekatan metode penetrasi testing
- Privilege Escalation dengan dirtyCOW 


## Summary

tl;dr
- Login ke telnet melalui port 23 untuk mendapatkan kredensial
- Login ke SSH menggunakan kredensial yang didapatkan pada telnet
- Gunakan [DirtyCOW](https://raw.githubusercontent.com/Gigi4/code/master/dirty.c) untuk privilege escalation 
- Ketikkan perintah `tree | md5sum` pada direktori `/root` setelah membuat file `coal` di direktori tersebut 

## Write-up

Task kali ini akan mengeksploitasi mesin yang di deploy menggunakan kernel linux yang rentan terhadap CVE-2016-5195 (**Dirty COW**).

Berikut penyelesaiannya dengan pendekatan dari fase-fase yang umumnya ada pada penetration testing.

## Port Scannning
Fase ini melakukan pemindaian port pada mesin yang di deploy menggunakan nmap.

```
nmap [IP_MESIN]
```
Hasil pemindaian :

![81fe1a00adffa559082577f8d6df28e9.png](./_resources/39688e49c3d4462ba3f468e45b647bb9.png)

### Q1: What old, deprecated protocol and service is running?

Dari hasil pemindaian diatas, protokol usang yang berjalan ada pada port 23, yaitu `telnet`. 

> Telnet dikembangkan pada tahun 1969. Telnet pada saat itu banyak dipakai oleh institusi akademik, perusahaan swasta, hingga fasilitas penelitian milik pemerintah untuk *remote login*. Pada saat itu juga keamanan belum terlalu menjadi perhatian sampai tahun 1990. 
> Pengunaan telnet seharusnya di hentikan karena beberapa alasan berikut :
> - Tidak ada enkripsi dalam proses pengiriman datanya
> - Umumnya tidak ada otentikasi (user dan password)
> - Banyak celah kerentanan

## Initial Access

Telnet dapat diakses menggunakan **telnet client** (umumnya sudah menjadi bawaan pada distribusi linux) atau **netcat**.

Cara mengaksesnya cukup dengan perintah

```
telnet [ip] [port]
```

### Q2: What credential was left for you?

Saat mendapatkan akses ke telnet, terdapat *banner* yang berisi kredensial dengan, 

`username: santa`   
`password: clauschristmas`  

![e195586090cb9587b87d93c99f249aa9.png](./_resources/4464da52f2534298bbf372d015857f90.png)

## Enumeration

Enumerasi secara internal dapat dimulai dengan perintah-perintah untuk mendapatkan informasi dari sistem, seperti

`cat /proc/version`
`uname -a`
`lsb_release -a`

![107a51eddd2b8f2c728b044d43c58470.png](./_resources/8bffa2aead214527b3be638767e14349.png)

> Referensi :
https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/

### Q3: What distribution of Linux and version number is this server running?

Hasil enumerasi mendapati versi dan distribusi linux yang berjalan pada mesin tersebut adalah `Ubuntu 12.04` dan kernelnya adalah versi 3.2.0 (2012) 

Mesin tersebut kemungkinan besar rentan terhadap kernel exploit [Dirty COW](https://dirtycow.ninja/) (CVE-2016-5195).

> Take a look at the cookies and milk that the server owners left for you. You can do this with the cat command as mentioned earlier.
> cat cookies_and_milk.txt.

### Q4: Who got here first?

![043e614c4b598946e42bd3ce4e5adb84.png](./_resources/cd92c04996e2489983b7bde69912ad15.png)

Berdasarkan gambar diatas, jawabannya adalah the `Grinch`.

### Q5: What is the verbatim syntax you can use to compile, taken from the real C source code comments?
File cookies_and_milk.txt mengandung source code asli dari repository berikut:

https://raw.githubusercontent.com/Gigi4/code/master/dirty.c

Yang juga merupakan salah satu dirtyCOW exploit. Cara compile berdasarkan source codenya adalah:

```
gcc -pthread dirty.c -o dirty -lcrypt`
```

## Privilege Escalation
### Q6: What "new" username was created, with the default operations of the real C source code?

Exploit tersebut dapat digunakan untuk privilege escalation dan membuat username baru bernama `firefart`.

![aa0107d3b951421adcb5437df38ebd2b.png](./_resources/8f4d655255a549c9a9182b9ed5a5c67a.png)

Setelah exploit berhasil, pindah akun ke `firefart` dengan perintah `su firefart`

![e5067ee8a7cd6d1455f8b96f7c92fa94.png](./_resources/863de28d74ee48a083dc777157fcf1fe.png) 

![3d86c7d3807b128482f70149881f5155.png](./_resources/0a96c9f942dc4543bceffc820799955c.png)

Untuk menjawab pertanyaan terakhir, kita perlu membuat file `coal` di direktori `/root`. 

```
$ cd /root
$ touch coal
$ tree | md5sum
```

### Q7: What is the MD5 hash output?

![0a83859d1ac66ba3a83693921f7eb334.png](./_resources/1a216839d7df44e4a223f97fdc5bb626.png)

done.





