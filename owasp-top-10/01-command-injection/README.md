# Command Injection
Notes:
Active command injection returns the reponse, visible in user.
Blind command injection does not return the error/hidden/not visible in the html page.

Example vulnerable code.
```
<?php 	
	if (isset($_GET['commandString'])) {
		$command_string = $_GET['commandString'];
		
		try {
			passthru($command_string);
		} catch (Error $error){
			echo "<p class=mt-3><b>$error</b></p>";
		}
 	}
?>
```


## Practical

![f6cf92a6d1447c91359426646f7e4138.png](./_resources/b22a11f8dfed45dd9b6ad173f79e643e.png)

![23ab77a23e862943ecf0e0a9752f7e89.png](./_resources/36c82b0c07364cc9971635bca0a9329d.png)

```
uname -a; lsb_release -a
```

![6c17c7cd54bdf0345f93074acc55ab34.png](./_resources/c9607a537ec446e495b1d64146bb819f.png)

```
cat /etc/passwd
```

![d26d61264971e0a5d9e643fe5bcb51e4.png](./_resources/4a23641e2b1d43aa8db712e580630e15.png)

```
cat /etc/update-motd.d/00-header
```

![34030700a97f4fe416a7366468fe5e23.png](./_resources/9cdc4738b51c4d6099867ffda0956119.png)
## Question

![e7389ff9a6c539af06cd2c9eaf1783cd.png](./_resources/f18ea53966004df690c323f0f6270b2b.png)