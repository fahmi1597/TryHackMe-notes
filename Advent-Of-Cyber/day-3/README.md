# Day 3 |  Christmas Chaos

`TryHackMe` `Web Exploitation` `Security` `Authentication Bypass` `Bruteforce`

---

## Learning Outcomes

Hasil pembelajaran 

- Mengerti perbedaan antara Authentication dan Authorization
- Mengetahui penggunaan dari default credentials.
- Brute force dan bypass login page dengan Burp Suite

## Summary

tldr;

- Intersep login request dengan Burp Suite
- Gunakan default credential umum yang ada pada task ini
- Lakukan brute force dengan tipe serangan cluster bomb menggunakan intruder
- Identifikasi login yang sukses berdasarkan HTTP Status Code atau Length dari HTTP Response

## Story

>*McSkidy is walking down the corridor and hears a faint bleeping noise, Beep.... Beep.... Beep... as McSkidy gets closer to Sleigh Engineering Room the faint noise gets louder and louder.. BEEP.... BEEP.... Something is clearly wrong! McSkidy runs to the room, slamming open the door to see Santa's sleighs control panel lite up in red error messages! "Santa sleigh! It's been hacked, code red.. code red!" he screams as he runs back to the elf security command center.*
>
>*Can you help McSkidy and his team hack into Santa's Sleigh to re-gain control?*

## Write-up

Mesin yang di deploy dari task pada room ini masih berupa sebuah web server.

### Q1 : What is the flag?

Disini, saya dalam posisi sudah mempersiapkan Burp suite untuk melakukan intersep request yang dilakukan pada login page berikut.

![9fc2a7f80c8e4fe62efcda74ad28c791.png](./_resources/b5cdc92eee094a41b614c65fbd1c700c.png)

Terlihat dua parameter yang dikirim pada body http request.
- username 
- password

Tekan kombinasi `ctrl+i` pada request untuk mengirimnya ke Intruder.

Fitur `Intruder` dari Burp suite dapat digunakan untuk melakukan bruteforce. 

![24193b31673c079e386c912a23aa3f05.png](./_resources/d6f64a2ddf6c4503a8e71f344c97b704.png)

Pada tab positions, kita menentukan tipe serangan yang akan dilakukan. Disini menggunakan cluster bomb, artinya menggunakan semua kombinasi dari Payloads yang di set.


![76060f91397486376fbcefa6942829af.png](./_resources/3e6191ffb8d24b2bbae1af66e804ad64.png)


Username dan password yang umum dapat digunakan sebagai payload.

| Username 	| Password 	|
|:---------:|:---------:|
| root		|	root	|
| admin		|	password|
| user		|	12345	|

List username dimasukkan pada payload ke 1, sedangkan password dimasukkan pada payload ke 2.

![2a96f6939f830edf978c479d4bca773e.png](./_resources/1391fd87a38b4b0d9d3c55e7c95649b1.png)

Setelah payload selesai dibuat, maka attack dapat mulai.

![adbe7340c691bc6b21d8f0e013dfef03.png](./_resources/2e2b19925782449699c64d19d6981dc9.png)

Berhasil atau tidaknya serangan menggunakan payload tersebut dapat diidentifikasi melalui `Status` atau `Length`

`Status` adalah kode status dari HTTP Response, sedangkan `Length` adalah isi dari http response. `Status 200` atau perubahan pada Length dapat berarti sesuatu. 

![f66e804ad64c64d19d6981dc9.png](./_resources/f66e804ad64c64d19d6981dc9.png)

Berdasarkan gambar di atas, response yang diberikan mengandung `status 302` tetapi lengthnya tidak sama dengan yang lain. Hal ini bisa diartikan bahwa `admin:12345` adalah username dan password yang valid.

Lihat gambar berikut untuk lebih jelasnya.

![c7c1a47f05453bc1bbe1f0353be42f18.png](./_resources/e514676182984b968b840a1fd3cc9756.png)

Flag didapatkan setelah berhasil melakukan login

![91bb0dff46511a1e946b8aafdcdd7664.png](./_resources/15a1e606f28949a6b20c64a0f73bd218.png)

Namun ternyata dengan mengakses langsung `/tracker` tanpa username dan password, juga adalah `status 200`.

![c64d19d6981dc9b968b840a1fd3cc9756.png](./_resources/c64d19d6981dc9b968b840a1fd3cc9756.png)

