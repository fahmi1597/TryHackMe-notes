# Day 1 | A Christmas Crisis

`Web Exploitation` `HTTP` `Cookie`

---

## Learning Outcomes

- Learn how the web works and what is http?
- What are website cookies?
- Using CyberChef 
- Escalation of Privilege using cookies

## Summary

tldr;
- Register akun lalu login
- Periksa stored cookie value
- Decode cookie dari hex, hasil decode berupa json 
- Hanya bagian {"username":"value"} yang dinamik.
- Privilege escalation dengan meng*encode* ulang cookie
- Get the flag

## Write up

Tampilan web dari mesin yang di deploy :

![6f48785061d2c5b00e6038eb0d7c4e65.png](./_resources/d6fd84485b614c858eec4fe50b618753.png)


### What is the name of the cookie used for authentication?

Untuk mengetahui cookie yang digunakan untuk otentikasi, maka registrasi diperlukan.

- User `fahmi `  
- Password `fahmi`

![715f2fd701d6fe7560b65f15f9f1ecff.png](./_resources/633ec0092c734809b6ec32c15c407753.png)

Setelah login, ditampilkan sebuah dashboard untuk melakukan command control dan linenya dalam keadaan mati.

Mengaktifkan line tersebut adalah objektif dari task ini.

![b24c7cb5210478b8754c213d382a7582.png](./_resources/31bef68fc7cf4616afbe8791fc5f66f6.png)

Cookie yang tersimpan dapat dilihat menggunakan developer tools melalui kombinasi `ctrl+shift+i` atau `f12`.

![95eb0c9d1b87bdc65f00e47a13d51c05.png](./_resources/b2f3c6dcf09c4453b0ac0f946187569b.png)

### In what format is the value of this cookie encoded?

Dengan menggunakan CyberChef --> Auto, format cookienya adalah hexadecimal.

### Having decoded the cookie, what format is the data stored in?

Masih menggunakan tools CyberChef
https://gchq.github.io/CyberChef/#recipe=From_Hex('Auto')

Input :
```
7b22636f6d70616e79223a22546865204265737420466573746976616c20436f6d70616e79222c2022757365726e616d65223a226661686d69227d
```

Output :
```
{"company":"The Best Festival Company", "username":"fahmi"}
```

### What is the value of Santa's cookie?

Setelah melakukan dua kali register, ternyata hanya bagian username yang berubah. 

Maka, hal yang bisa dicoba adalah merubah data output dengan username yang berbeda setelah itu encode kembali sebagai hex.



![d029bcc35173406eb7ad4dbf2ad65850.png](./_resources/d029bcc35173406eb7ad4dbf2ad65850.png)


Hasil :

```
7b22636f6d70616e79223a22546865204265737420466573746976616c20436f6d70616e79222c2022757365726e616d65223a226661686d69227d
```

Ganti value yang ada pada browser dengan value baru yang di generate melalui CyberChef

![57825f555931d68ed018918e880014cb.png](./_resources/b7b94bc5c88e44038832055e598a60a3.png)