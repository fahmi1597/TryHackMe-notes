# Day 20 |  PowershELlF to the rescue

`TryHackMe` `Powershell`

---

## Learning Outcomes

## Summary

## Story
Someone is mischievous at The Best Festival Company. The contents within the stockings have been removed. A clue was left in one of the stockings that hints that the contents have been hidden within Elfstation1. McEager moves quickly and attempts to RDP into the machine. Yikes! He is unable to log in.

Luckily, he has been learning PowerShell, and he can remote into the workstation using PowerShell over SSH.

## Write-up

### Challenge
Use the PowerShell console to navigate throughout the endpoint to find the hidden contents to reveal what was hidden in the stockings.


```
ssh -l mceager 10.10.126.0
r0ckStar!
```

![d7a6ddcec0e33e69a3b535e6be095020.png](./_resources/e176a3ab8766420daa0cb13767329ff3.png)

### Q1: Search for the first hidden elf file within the Documents folder. Read the contents of this file. What does Elf 1 want?

![2d9db00e332faa3a12c27bbe2d0e0648.png](./_resources/50b66e0e5fa44e4986029baf9e3b35ab.png)

![9841b382f985c0adce5233ee4ba37421.png](./_resources/77475fb5d8714229b02542b47f31d762.png)

### Q2: Search on the desktop for a hidden folder that contains the file for Elf 2. Read the contents of this file. What is the name of that movie that Elf 2 wants?

![b28bcb4895cbff695ebbc8f17de7d7d2.png](./_resources/984b33c4b9d944f6bffe618b99768cae.png)

![d8825d7a57937c080a3dda618aa99bb3.png](./_resources/793207483dbc418894f6114f55365939.png)

### Q3: Search the Windows directory for a hidden folder that contains files for Elf 3. What is the name of the hidden folder? (This command will take a while)

```
gci -Path C:\Windows\ -Filter '*3*' -Hidden -Directory -Recurse

```

![35336aaf67363671bdb385fbbc46e584.png](./_resources/97216f9f7a9c4ba3876c77cbc2ec6bed.png)

### Q4: How many words does the first file contain?

![f6c0d3f3942b44bc648d4a4be4513459.png](./_resources/1ff77e3432a948d89c2c409b134f6fc2.png)

### Q5: What 2 words are at index 551 and 6991 in the first file?

![1afdc4fb92ccce4f7637bbff27c5f14c.png](./_resources/841d816d88bf48d2b2befbdbb6824640.png)
### Q6: This is only half the answer. Search in the 2nd file for the phrase from the previous question to get the full answer. What does Elf 3 want? (use spaces when submitting the answer)

![cf9d062401c745c72d4fd1b742d70a53.png](./_resources/36b60b44504a4617963fd22b1f7f9c74.png)