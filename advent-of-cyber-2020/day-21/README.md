# Day 21 | Time for some ELForensics

`TryHackMe` `Powershell` `Forensics` `Alternate Data Stream`

---

## Learning Outcomes

## Summary

## Story

One of the 'little helpers' logged into his workstation only to realize that the database connector file has been replaced, and he can't find the naughty list anymore. Furthermore, upon executing the database connector file, a taunting message was displayed, hinting that the file was moved to another location.

McEager has been notified, and he will put the pieces together to find the database connector file.

## Write-up

### Q1: Read the contents of the text file within the Documents folder. What is the file hash for db.exe?

`Get-FileHash -Algorithm MD5`
![5d50e62b5a489ce682f3fde0c3c25f32.png](./_resources/dd18435d001d4cbca276a46cdd943c3d.png)



### Q2: What is the file hash of the mysterious executable within the Documents folder?


![5156eb1d76512f7ec223e3e47339ed8f.png](./_resources/41fa4957a6324f06aeba638b9bb5fa28.png)

### Q3: Using Strings find the hidden flag within the executable?

![6d5819af3296e461f35c4c1655bef32e.png](./_resources/db37e5a9c0634d3caef5e13b516e0607.png)

### Q4: What is the flag that is displayed when you run the database connector file?

![406bb7fad4731729813f664dfbbed4a4.png](./_resources/525bee3d9fb0446f915876f9710b9a5c.png)

![2474bb4305b3a42949bedc94951bc0cf.png](./_resources/b7f753c73ae94905aefec41e66306e07.png)