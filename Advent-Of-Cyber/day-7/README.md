# Day 7 |  The Grinch Really Did Steal Christmas

`Networking` `Wireshark` `Packet Analysis`

---

## Learning Outcomes
- Understanding
	- IP address
	- Network Protocol
	- TCP/IP Three-Way handshake
- Packet analysis using Wireshark
- Extracting file from pcap.

## Summary

1. Download the file provided in this task.
2. Open it on wireshark
3. Use icmp as filter for question 1.
4. Use http as filter for question 2.
5. Use ip address and http as filter for question 3
6. Use ftp as filter for question 4.
7. Use wireshark export feature to recover a captured zip file from a specific packet.

## Write up

Pada task kali ini, writeup akan mengikuti *Challenge* yang diberikan dan menjawab pertanyaan-pertanyaan yang diberikan dibawah.

### Challenge :
*"Download the ZIP file "aocpcaps.zip" that is attached to this task, use a combination of the filters and features of Wireshark we've covered to answer the questions below:"*

#### Open `pcap1.pcap` in Wireshark. What is the IP address that initiates an ICMP/ping?

Dengan menggunakan filter icmp dan melihat urutan nomer paket, kita bisa melihat siapa yang terlebih dulu menginisiasi sebuah ping (request).

![8b145a016089ada85c4d7acc8aa07cde.png](./_resources/175eecbf1d4149ac846fe41afa5bdaae.png)


#### If we only wanted to see HTTP GET requests in our `pcap1.pcap` file, what filter would we use?

Hal ini cukup dengan menggunakan filter `http.request.method == GET`

![d91f1d61592eefd8e44970c539f7c985.png](./_resources/4a8a1763e20f495aaf3b648725c8d310.png)

#### Now apply this filter to `pcap1.pcap` in Wireshark, what is the name of the article that the IP address `10.10.67.199` visited?

Untuk menjawab pertanyaan ini, kita bisa menggunakan dua filter. Filter yang pertama adalah IP address dan yang kedua adalah http requestnya, karena umumnya metode yang digunakan untuk me-*retrieve* data adalah `GET`

![221da0b7a20fa0507a390fa7de6c8f4b.png](./_resources/e7bf87b628f64f8da737cc9c47df0a8f.png)

#### Let's begin analysing `pcap2.pcap`. Look at the captured FTP traffic; what password was leaked during the login process?

Untuk menjawabnya cukup dengan menggunakan filter ftp.

![789bf68aa0133da265e1163ffc45a60a.png](./_resources/5ad8bdbe41a84a5b9c5a9a6d0bc55061.png)

#### Continuing with our analysis of `pcap2.pcap`, what is the name of the protocol that is encrypted?


![8d278995f6724152109da36c7fb66ace.png](./_resources/cc06b02b82fb48d79b5cf98f40b9a3cf.png)

#### Analyse `pcap3.pcap` and recover Christmas! What is on Elf McSkidy's wishlist that will be used to replace Elf McEager?


![dce91e2d67789aa8912c4041e2c8555d.png](./_resources/850f525afaca4ab596a134be00e55cdf.png)

Berdasarkan gambar tersebut, kita dapat melakukan ekstraksi file yang ada pada paket No. 395 dengan fitur *export* dari wireshark.

```
File -> Export Objects -> HTTP.
```

![cdbce9a6a89a5d5e8512beab783e22c1.png](./_resources/95ca1ddd355c48f4a89f6d34b28d0b81.png)
