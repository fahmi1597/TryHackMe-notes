# Components With Known Vulnerabilities

A public exploit (PoC) of CVEs sometimes can be used and is work against an unupdated/old software version.

With this known vulnerabilities, the attackers only need to gather enough related information of the app.

Note:
- Most public exploit will just tell what arguments you need to provide, but some may not or even need a bit modification to get it work.

## Practical

![6d8543535ba6a10f4cfcd162db198416.png](./_resources/bb0eff273442421b9ede04ff6990dc71.png)

### Gathering information

First, let's take a look into the footer section
![7023cf26eb220d34db0f3870b517b7a5.png](./_resources/ab6bd23dbb27472b8a3f91b58ed60079.png)

Note:
- `projectworlds` - is the developers  
- `2017` - probably year of software release/made.

It's a free software.

https://projectworlds.in/free-projects/php-projects/online-book-store-project-in-php/

We can login with the default username and password   

- username : `admin@admin.com`
- password : `admin`
  

![90793ca4b5fc5cdec718b7dd63ed9e5a.png](./_resources/d6d7b1d7ed4346018743a19bdded367a.png)

exploitdb search results

![671b74aad336b487b5951d39500e1a68.png](./_resources/7a63b51c0c344e078fe804c1629f68fa.png)

Let's see how we can fix this.

![080b96973537ae3c94b259ab86b5df2b.png](./_resources/170bc9d0995f4fcdaba63ec06c1f053b.png)

But since the webshell was already uploaded

![143621a2b4d6a2f3d6989ce5460febb3.png](./_resources/cf955275905b40f98c5679a8a253fa36.png)

We could make a pseudo-shell after we change the `$_GET` to `$_REQUEST`

![5324dbe2f229e2fddb2b5d9d4a925d42.png](./_resources/51dba9be44164985a21001313319e753.png)

![f7085a6acace0c42238e32c0eb8bd6c7.png](./_resources/6acc21eb3dd0458ea7d63a9b16d5be80.png)