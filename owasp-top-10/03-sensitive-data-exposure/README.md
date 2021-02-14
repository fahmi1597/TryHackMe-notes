# Sensitive Data Exposure

Note:
- When web apps accidentally divulges sensitive data (e.g. username, password, email, banking-related information, etc), it referred as "Sensitive Data Exposure"
- In network level, an attacker who can sniffs / eavesdropping to the network packet/traffic (Man-in-the Middle) may obtains a sensitive data as well as intercepting data. 

### sqlite3 note

Accessing database 
```
$ sqlite filename.db
```

Get all tables
```
sqlite>.tables
```

Get table columns
```
sqlite> PRAGMA table_info(tablename)
```


## Practical / Challenge

> Have a look around the webapp. The developer has left themselves a note indicating that there is sensitive data in a specific directory. 

Leaving to do note in html comment is bad.

![b824e1f6739c217c5d5f6b6b3d0e4c71.png](./_resources/b3a225d7b70c497e94cad0249f6715dc.png)

Directory listing found in /assets

![41f25668b4996dfd43930d267940d65c.png](./_resources/35309165bda84666ac00df5e85052b2a.png)

Sensitive data from webapp.db

![bf5a86cbb66516f7fbd2947f95ea5e97.png](./_resources/6a26ffd5cc8442fb98fdf224c572b98c.png)

Cracked password

![c97dfeaea989999c860433fd5be3638c.png](./_resources/6d88f94accd94ab6b7d8bb015fe69343.png)

Logged in

![08139889e49309b8788033d626a2342d.png](./_resources/45b3013c9ad14ae8993459e2cf1151be.png)


## Questions
![5a8a62cfb5d8d025eca64e7d898d9c83.png](./_resources/34259372b6b04c82806cfef76c72f860.png)