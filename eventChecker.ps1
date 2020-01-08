param([string]$type, [string]$search, [string]$who)

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    Break
}

if ($type -eq "power")
{
    Get-EventLog -LogName System -ComputerName $search | Where-Object {$_.EventID -eq 1074} | Select-Object -Property Timegenerated, Message | Format-List
}

if ($type -eq "login")
{
    Get-EventLog -LogName Security -Newest 800 -ComputerName $search | Where-Object {$_.EventID -eq 4624} | Select-Object -Property Timegenerated, Message | Format-List > thischeck.txt
    Get-Content .\thischeck.txt | Select-String '(Timegenerated)|(Account Name)|(Source Network Address)' | Select-String -not "-"
}

if ($type -eq "failure")
{
    Get-EventLog -LogName Security -Newest 800 -ComputerName $search | Where-Object {$_.EventID -eq 4625} | Select-Object -Property Timegenerated, Message | Format-List > thischeck.txt
    Get-Content .\thischeck.txt | Select-String '(Timegenerated)|(Account Name)|(Source Network Address)' | Select-String -not "-"
}
