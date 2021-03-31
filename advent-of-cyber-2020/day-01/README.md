# Day 1 | A Christmas Crisis

`TryHackMe` `Web Exploitation` `Security` `HTTP` `Cookie`

---

## Learning Outcomes

Hasil pembelajaran 

- Memahami bagaimana alur bekerja web 
- Memahami protokol HTTP beserta metode *request*nya.
- Mengerti apa itu dari website cookies
- Mengetahui cara menggunakan *tool* CyberChef
- Menggunakan cookies untuk menaikkan hak akses (*Privilege Escalation*)

## Summary

tldr;

- Akses IP mesin melalui browser, buat akun dan login
- Periksa cookie yang tersimpan lalu decode menggunakan [CyberChef](https://gchq.github.io/CyberChef/)
- Hasil decodenya dalam bentuk JSON dan hanya bagian *username* yang berubah/dinamis.
- Ubah bagian *username* dari cookie untuk Privilege Escalation.
- Hijaukan panel kontrol untuk mendapatkan flag.


## Task Story

> *"The Best Festival Company's brand new OpenVPN server has been hacked. This is a crisis!*  
>
> *The attacker has damaged various aspects of the company infrastructure -- including using the Christmas Control Centre to shut off the assembly line!*
>
> *It's only 24 days until Christmas, and that line has to be operational or there won't be any presents! You have to hack your way  back into Santa's account (blast that hacker changing the password!) and getting the assembly line up and running again, or Christmas will be ruined!"*

## Write-up

Tampilan web dari mesin yang di deploy 

![6f48785061d2c5b00e6038eb0d7c4e65.png](./_resources/d6fd84485b614c858eec4fe50b618753.png)


### Q1 : What is the name of the cookie used for authentication?

Registrasi diperlukan untuk mengetahui cookie yang digunakan saat otentikasi (login).

> username:password <-> fahmi:fahmi

![715f2fd701d6fe7560b65f15f9f1ecff.png](./_resources/633ec0092c734809b6ec32c15c407753.png)

Tampilan setelah login

![b24c7cb5210478b8754c213d382a7582.png](./_resources/31bef68fc7cf4616afbe8791fc5f66f6.png)

Mengaktifkan panel control tersebut adalah objektif dari task ini.

Cookie yang tersimpan dapat dilihat menggunakan Developer Tools melalui kombinasi `ctrl+shift+i` atau `f12`. Aplikasi browser yang digunakan disini adalah Firefox.

![95eb0c9d1b87bdc65f00e47a13d51c05.png](./_resources/b2f3c6dcf09c4453b0ac0f946187569b.png)

Nama cookie yang digunakan adalah `auth`.

### Q2 : In what format is the value of this cookie encoded?

Dengan menggunakan CyberChef --> Auto, format cookie yang digunakan adalah `hexadecimal`.

### Q3 : Having decoded the cookie, what format is the data stored in?

Masih menggunakan CyberChef.

Input yang diberikan :

```
7b22636f6d70616e79223a22546865204265737420466573746976616c20436f6d70616e79222c2022757365726e616d65223a226661686d69227d
```

Output yang didapatkan 
```
{"company":"The Best Festival Company", "username":"fahmi"}
```

Berdasarkan output yang didapatkan, format data tersebut menggunakan format `JSON`.

### What is the value of Santa's cookie?

Setelah melakukan dua kali register, ternyata hanya bagian `username` yang berubah. 

Berdasarkan hal ini, kita dapat mencoba merubah bagian data `{"username" : "fahmi"}` menjadi `{"username" : "santa"}` lalu encode kembali ke format `hexadecimal`.

![d029bcc35173406eb7ad4dbf2ad65850.png](./_resources/d029bcc35173406eb7ad4dbf2ad65850.png)


Berikut hasil yang didapatkan

```
7b22636f6d70616e79223a22546865204265737420466573746976616c20436f6d70616e79222c2022757365726e616d65223a226661686d69227d
```

Buka kembali Developer Tools untuk merubah value dari cookie yang tersimpan pada browser dengan value yang dibuat menggunakan CyberChef.

![57825f555931d68ed018918e880014cb.png](./_resources/b7b94bc5c88e44038832055e598a60a3.png)