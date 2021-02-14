# Broken Access Control

Broken access control is a vulnerability that allows an unauthorized user to view or access a protected page/pages.

Example:

UserA is a normal user and is logged in to a web app 

`http://example.com/home?id=1000`

Suppose that id = 1 belongs to a admin user, if the apps didn't properly configured the access control logic.
It might be possible an attacker could just change the id from 1000 to 0.

`http://example.com/home?id=0`
 
## Practical 
 
### Insecure Direct Object Reference
 
IDOR is a type of access control vulnerability that allows a user accessing other users resources.

![7bdb3353c1aa13523b97cdba6cacf9be.png](./_resources/65e742fddca7418e8f5187d7cce25515.png)

![7bf2237f38d9053a0fdc66d0728eba90.png](./_resources/75e17579d1cc422c88809d243004bb15.png)

![353f279cde0a8fa04d4625723c6a24f2.png](./_resources/99122edbd4c347cbbbc6b0213dd25414.png)

Another example is an unauthorized user can access  

http://example.com/username/file?fileId=2820 -> thesis.pdf 
to
http://example.com/username/file?fileId=100 -> alloreillybookspirated.pdf

## Questions

![cfddaab8b84e554a1ef385a1a5f62afd.png](./_resources/e6e645e6249a4c86b055afb512a38354.png)