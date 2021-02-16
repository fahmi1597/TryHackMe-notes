# Flask Injection 

Injection in flask template engine categorized as Server-Side Template Injection vulnerabilities,

It occurs when an unsanitized user input is passed  directly into the application templating process. This allows attackers interfere the templating process by injecting the native template syntax.

## Practical

Vulnerable code:

![d500a41488b1eb66d42a4d3fa000fa6c.png](../_resources/32c545d6c13c47b7bfbf51df6a093190.png)

This is how the app supposed to work.

![515392d0615d3f78e8e67c1e349a3fd7.png](../_resources/4af285d78b3643a5a993e9db86ebe418.png)

Below is not.

![eb6b002a33872f4b6edc171fa8a1c5e1.png](../_resources/11694a66aae6474587778456256d7d2e.png)

Example Local File Inclusion :

![5ac5179d5ae4390f060e436457735247.png](../_resources/a8cd947fad6c4efc808b3cd43f6c411d.png)

