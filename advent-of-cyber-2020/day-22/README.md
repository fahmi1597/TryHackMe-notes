# Day 22 | Elf McEager becomes CyberElf

`TryHackMe` `Cyberchef` `Encoding` 

---

## Learning Outcomes

## Summary

## Story
The past few days there have been strange things happening at Best Festival Company. McEager hasn't had the time to fully investigate the compromised endpoints with everything that is going on nor does he have the time to reimage the workstations. McEager decides to log into a different workstation, one of his backup systems.

McEager logs in and to his dismay he can't log into his password manager. It's not accepting his master key! He notices that the folder name has been renamed to something strange.

## Write-up

![34be7a8deefc334801c6496ccec0ee07.png](./_resources/d2d5ed357c6a49bc8e833805425494e3.png)

### Q1: What is the password to the KeePass database?

![e1fd73d7c62a2b71a6bacda40df7e384.png](./_resources/f0fadfb8f8b44a0d8c8a4aec5e9cabb3.png)

### Q2: What is the encoding method listed as the 'Matching ops'?

![52f752c3d3d03dd0eb6fbcdf9ba6be0f.png](./_resources/498950e641644ac99366344753211c61.png)

`thegrinchwashere`

![12658157b72d309f59bfe94df315d46d.png](./_resources/fc0268c0a63441b5bc19164d62c960fe.png)
### Q3: What is the decoded password value of the Elf Server?

![0f68df96343fb44227a7dca69c7337c3.png](./_resources/bb8c2a70c9f74697b3087c17ee841bdc.png)

Elf Server:
`elfadmin:736e30774d346e21`


![36ec57b249290ef2ed92f55a59e3e740.png](./_resources/797aadad99b94ba88b80c617f3c579ae.png)

### Q4: What is the decoded password value for ElfMail?

![b908570b68de6197c03805a0175f9e03.png](./_resources/128691385a9c447bbc2b62f6ee1334f1.png)


![bb205ba6d2d65f949b7d25a3bc1d2a8a.png](./_resources/a82be439cb044813a7b05b95b8246dc4.png)

### Q5: Decode the last encoded value. What is the flag?

![d816bfe7a731044cf24c39dba869567e.png](./_resources/fcf6a1a865e74004b0ccdd8feaa83424.png)