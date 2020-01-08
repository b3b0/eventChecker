# eventChecker
Simple PowerShell tool to tell you about latest logins, failures to login and power (shutdown, restart) events. 
 ![alt text](https://i.imgur.com/uR3bItw.png "Logo Title Text 1")
 
 ## Use
 
 **./eventChecker.ps1** type *[login, failure, power]* servername *[only you know this]*
 
 Example:
 
 >./eventcheck.ps1 power myserver.mydomain.com
 >TimeGenerated : 1/1/2020 10:40:45 PM
>Message       : The process C:\Windows\System32\RuntimeBroker.exe (MYSERVER) has initiated the restart of computer MYSERVER on behalf of 
>               MYDOMAIN\Administrator for the following reason: Other (Unplanned)
>                 Reason Code: 0x5000000
>                 Shutdown Type: restart
>                 Comment:
