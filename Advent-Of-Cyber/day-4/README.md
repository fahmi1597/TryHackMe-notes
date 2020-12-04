# Day 4 |  Santa's watching

`Web Exploitation` `Fuzzing`

---

## Learning Outcomes

- Understand the use of fuzzing.
- Understand how a specific error condition can be abused.

## Summary

- Use directory bruteforce tools to find a hidden directory
- Use wfuzz to get the correct parameter value.

## Write up

Mesin yang di deploy adalah sebuah web yang menurut cerita dari "*event*" ini, telah di *deface*.

![2699b863cd80c548dfcfabb18e71b743.png](./_resources/f00827b5f7b34ff49eb0750cd392e556.png)

*Challenge* kali ini adalah menemukan *hidden directory* dengan cara melakukan *brute-force* dengan *wordlist*.

Disini *tools* yang digunakan adalah [gobuster](https://github.com/OJ/gobuster), 

> Cara instalasi disertakan diakhir writeup.

```
gobuster dir -u http://10.10.251.28/ -w /opt/SecLists/Discovery/Web-Content/raft-large-directories.txt -t 10
```

![81fa495f1280c0c722dbb38fcd20112a.png](./_resources/474b47261edb4fc18a96a9bfff6355d9.png)

> Gobuster memiliki 3 mode, yaitu : `dir`, `dns` dan `vhost`

Ditemukan direktori `/api` dengan code 302 (redirect) dan setelah dikunjungi terdapat file `site-log.php`.



![129fa9228b6c6e619e19685458b8399d.png](./_resources/f6273ccf7d4d44d08a217a40efaa76dc.png)

Menurut challengenya, file ini memiliki parameter `date`, namun value yang diinput harus tepat. Diketahui juga format parameter `date` adalah YYYYMMDD. 




Disini teknik fuzzing dapat digunakan menggunakan tools wfuzz bawaan dari Kali Linux.

> Wordlist disedikan oleh TryHackMe dalam format YYYYMMDD

```
wfuzz -c -z file,wordlist --hc 404 http://10.10.251.28/api/site-log.php?date=FUZZ

```

Outputnya 

```
********************************************************
* Wfuzz 2.4 - The Web Fuzzer                           *
********************************************************

Target: http://10.10.251.28/api/site-log.php?date=FUZZ
Total requests: 63

===================================================================
ID           Response   Lines    Word     Chars       Payload           
===================================================================

000000006:   200        0 L      0 W      0 Ch        "20201105"        
000000002:   200        0 L      0 W      0 Ch        "20201101"        
000000005:   200        0 L      0 W      0 Ch        "20201104"        
000000004:   200        0 L      0 W      0 Ch        "20201103"        
... <snip>
```
Hasil output diatas memiliki ciri yang sama, yaitu 200,0,0,0 artinya *request* tersebut jika diakses pada browser akan menghasilkan *blank page*.

Kita dapat memberikan *filter* untuk mencari hasil output yang **<u>berbeda</u>**. Untuk kasus ini dengan menambahkan opsi `--hh 0` untuk menyembunyikan semua *request* yang menghasilkan *response* 0 *word*.

```
wfuzz -c -z file,wordlist --hh 0 http://10.10.251.28/api/site-log.php?date=FUZZ

********************************************************
* Wfuzz 2.4 - The Web Fuzzer                           *
********************************************************

Target: http://10.10.251.28/api/site-log.php?date=FUZZ
Total requests: 63

===================================================================
ID           Response   Lines    Word     Chars       Payload           
===================================================================

000000026:   200        0 L      1 W      13 Ch       "20201125"
```

Output diatas menghasilkan Word = 1 W, Chars = 13 Ch, artinya jika request di *kirim* pada url `http://10.10.251.28/api/site-log.php?date=20201125` hasilnya tidak *blank page*. 

Namun disini saya menggunakan curl.

![ca14b88cebc748241ba937053232edd2.png](./_resources/9d9f558e7ae5454692b49b84b5e1c1e4.png)


## Misc : Gobuster Installation

**Prerequisite** :

- Golang 
```
apt install golang
```


**Instalation:**

```
$ cd /opt
$ git clone https://github.com/OJ/gobuster.git
$ cd gobuster/
$ go get && go build
$ go install
$ export PATH=$PATH:$GOPATH/bin
```