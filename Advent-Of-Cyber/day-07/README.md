# Day 7 |  The Grinch Really Did Steal Christmas

`TryHackMe` `Networking` `Forensic` `Wireshark` `Packet Analysis`

---

## Learning Outcomes

Hasil pembelajaran

- Memahami :
	- Apa itu IP address
	- Network Protocol
	- TCP/IP Three-Way handshake

- Mempelajari cara menggunakan Wireshark
	- Dasar filtering dan operatornya
	- Network packet analysis

- Melakukan restorasi/ekstraksi file utuh dari paket yang terdapat pada pcap.

## Summary

tldr;

- Download file .pcap yang disediakan.
- Buka pcap dengan Wireshark.
- Gunakan icmp sebagai filter untuk pertanyaan no 1.
- Gunakan http sebagai filter untuk pertanyaan no 2.
- Gunakan kombinasi ip address dan http sebagai filter untuk pertanyaan no 3
- Gunakan ftp sebagai filter untuk pertanyaan no 4.
- Gunakan fitur export Wireshark untuk merecover file zip yang terekam pada salah satu paket di pcap3.

## Story

> It's 6 AM and Elf McSkidy is clocking-in to The Best Festival Company's SOC headquarters to begin his watch over TBFC's infrastructure. After logging in, Elf McEager proceeds to read through emails left by Elf McSkidy during the nightshift.
>
> More automatic scanning alerts, oh look, another APT group. It feels like it's going to be a long, but easy start to the week for Elf McEager.
>
> Whilst clearing the backlog of emails, Elf McEager reads the following: "URGENT: Data exfiltration detected on TBFC-WEB-01". "Uh oh" goes Elf McEager. "TBFC-WEB-01? That's Santa's webserver! Who has the motive to steal data from there?!". It's time for the ever-vigilant Elf McEager to prove his salt and find out exactly what happened.
>
> Unknowingly to Elf McEager, Elf McSkidy made this all up! Fortunately, this isn't a real attack - but a training exercise created ahead of Elf McEager's performance review.

## Write-up

Pada task kali ini, writeup akan mengikuti *Challenge* yang diberikan dan menjawab pertanyaan-pertanyaan yang diberikan dibawah.

### Challenge :
>Download the ZIP file "aocpcaps.zip" that is attached to this task, Use a combination of the filters and features of Wireshark we've covered to answer the questions below:

### Q1 : Open `pcap1.pcap` in Wireshark. What is the IP address that initiates an ICMP/ping?

Dengan menggunakan filter icmp dan melihat urutan nomer paket, kita bisa melihat siapa yang terlebih dulu menginisiasi sebuah ping (request).

![8b145a016089ada85c4d7acc8aa07cde.png](./_resources/175eecbf1d4149ac846fe41afa5bdaae.png)


### Q2 : If we only wanted to see HTTP GET requests in our `pcap1.pcap` file, what filter would we Gunakan?

Hal ini cukup dengan menggunakan filter `http.request.method == GET`

![d91f1d61592eefd8e44970c539f7c985.png](./_resources/4a8a1763e20f495aaf3b648725c8d310.png)

### Q3 : Now apply this filter to `pcap1.pcap` in Wireshark, what is the name of the article that the IP address `10.10.67.199` visited?

Untuk menjawab pertanyaan ini, kita bisa menggunakan dua filter. Filter yang pertama adalah IP address dan yang kedua adalah http requestnya, karena umumnya metode yang digunakan untuk me-*retrieve* data adalah `GET`

![221da0b7a20fa0507a390fa7de6c8f4b.png](./_resources/e7bf87b628f64f8da737cc9c47df0a8f.png)

### Q4 : Let's begin analysing `pcap2.pcap`. Look at the captured FTP traffic; what password was leaked during the login process?

Untuk menjawabnya cukup dengan menggunakan filter ftp.

![789bf68aa0133da265e1163ffc45a60a.png](./_resources/5ad8bdbe41a84a5b9c5a9a6d0bc55061.png)

### Q5 : Continuing with our analysis of `pcap2.pcap`, what is the name of the protocol that is encrypted?


![8d278995f6724152109da36c7fb66ace.png](./_resources/cc06b02b82fb48d79b5cf98f40b9a3cf.png)

### Q6 : Analyse `pcap3.pcap` and recover Christmas! What is on Elf McSkidy's wishlist that will be Gunakand to replace Elf McEager?


![dce91e2d67789aa8912c4041e2c8555d.png](./_resources/850f525afaca4ab596a134be00e55cdf.png)

Berdasarkan gambar tersebut, kita dapat melakukan ekstraksi file yang ada pada paket No. 395 dengan fitur *export* dari wireshark.

```
File -> Export Objects -> HTTP.
```

![cdbce9a6a89a5d5e8512beab783e22c1.png](./_resources/95ca1ddd355c48f4a89f6d34b28d0b81.png)
