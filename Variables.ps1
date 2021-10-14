
(12+5) * 3 / 4.5 
4GB / 720MB 
1mb

0xAFFE # hex

ipconfig # can run internal Fns

defrag C: # security issues

"C:\Windows\System32\notepad.exe"
& "C:\Windows\System32\notepad.exe" # The "&" changes string into commands:

$env:Path # trustworthy paths
$env:path += ";C:\Windows\System32\notepad.exe"
notepad.exe

Get-ChildItem c:\windows # parameters

Get-Help Get-ChildItem -full
Get-Help ls -full


#### NOTE: -path <string[]>


/*
### -include <string[]>

Retrieves only the specified items. The value of this parameter qualifies the Path parameter. Enter a
path element or pattern, such as "*.txt". Wildcards are permitted.
example:  "*.txt"
*/
Get-ChildItem c:\windows\System32 *.txt  -recurse -name
gci c:\windows\System32 *.txt  -recurse -name


Get-ChildItem -recurse  c:\windows\System32 *.txt  -name

Get-ChildItem -path c:\windows\System32 -filter *.txt 
Get-ChildItem -name c:\windows\System32 *.txt  -recurse 

Get-ChildItem -path c:\windows\System32 -filter *.txt -recurse -name
Get-ChildItem -pa c:\windows\System32 -fi *.txt -r -n

Get-ChildItem -recurse -name  c:\windows\System32 *.txt
#################################################################
$alias:Dir
$alias:ls
$alias:gci

Get-Alias | Where-Object {$_.Definition -eq "Get-ChildItem"}
Dir alias: | Out-String -Stream | Select-String "Get-ChildItem"

Dir alias: | Group-Object definition
##############################################################
Set-Alias edit notepad.exe # create your own alias
edit
$alias:edit


Export-Alias "C:\Users\w0038182\OneDrive - Nova Scotia Community College\Classes\Fall2020\INET - Server Scripting\PowerSellScripts\myalias"
notepad "C:\Users\w0038182\OneDrive - Nova Scotia Community College\Classes\Fall2020\INET - Server Scripting\PowerSellScripts\myalias"

Import-Alias "C:\Users\w0038182\OneDrive - Nova Scotia Community College\Classes\Fall2020\INET - Server Scripting\PowerSellScripts\myalias"
#Import-Alias "C:\Users\w0038182\OneDrive - Nova Scotia Community College\Classes\Fall2020\INET - Server Scripting\PowerSellScripts\myalias" -force

Del alias:edit
edit

###############################################################
Notepad "C:\Users\w0038182\OneDrive - Nova Scotia Community College\Classes\Fall2020\INET - Server Scripting\PowerSellScripts\test.vbs"
#################################################################endregion


# Create variables and assign to values
$amount = 120
$VAT = 0.19
# Calculate:
$result = $amount * $VAT
# Output result
$result

# Replace variables in text with values:
[string]$text = "Net amount $amount matches gross amount $result"
$text


# Variable names with special characters belong in braces:
${this variable name is "unusual," but permitted} = "Hello World"
${this variable name is "unusual," but permitted}


# Temporarily store results of a cmdlet:
$listing = Get-ChildItem c:\
$listing


# Temporarily store the result of a legacy external command:
$result = ipconfig
$result


# Populate several variables with the same value in one step:
$a = $b = $c = 1
$a


$Value1 = 10
$Value2 = 20
$Temp = $Value1
$Value1 = $Value2
$Value2 = $Temp


# Exchange variable values:
$Value1 = 10; $Value2 = 20
$Value1, $Value2 = $Value2, $Value1
$Value2
$Value1

# Populate several variables with the same value in one step:
$Value1, $Value2 = 10,20
$Value1, $Value2 = $Value2, $Value1
$Value2
$Value1

#finding vars
Get-ChildItem variable:value*

# Verify whether the variable $value2 exists:
Test-Path variable:\value2

# create a test variable:
$test = 1
# verify that the variable exists:
Dir variable:\te*
# delete variable:
del variable:\test
# variable is removed from the listing:
Dir variable:\te*

#Clear-Variable a <=>  $a = $null
#Set-Variable a 12 <=> $a = 12

# Create new variable with description and write-protection:
New-Variable test -value 100 -description "test variable with write-protection" -option ReadOnly
$test


# Variable contents cannot be modified:
$test = 200

del variable:\test -force
$test = 200


#New-Variable cannot write over existing variables:
New-Variable test -value 100 -description  "test variable with copy protection" -option Constant


del variable:\test -force
New-Variable test -value 100 -description  "test variable with copy protection" ` -option Constant
# variables with the "Constant" option may neither be
# modified nor deleted:
del variable:\test -force

# Parameter -force overwrites existing variables if these do not
# use the "Constant" option:
New-Variable test -value 100 -description "test variable" -force


Get-ChildItem variable:te*
# variable contains a description:
dir Variable:\test | Format-Table Name, Value, Description -autosize

dir Variable:\*| Format-Table Name, Value, Description -autosize


# normal variables may be overwritten with -force without difficulty.
$available = 123
New-Variable available -value 100 -description "test variable" -force


#all f automatic variables 
Dir variable: | Sort-Object Name | Format-Table Name, Description -autosize -wrap

# Verify user profile:
$HOME

#"current process -ID of PowerShell is $PID"
Get-Process -id $PID

#Reading Particular Environment Variables
$env:windir


# push in current locaction to a stack :
Push-Location
# change to Windows folder
cd $env:windir
Dir
# pop back to initial location after executed task
Pop-Location

##Searching for Environment Variables
#Windows environment 
Dir env:
$env:userprofile


$env:windir
<# Using this statement, you've just read the contents of the environment variable windir. However, in
reality, env:windir is a file path and leads to the "file" windir on the env:drive. So, if you specify a
path name behind "$", this variable will furnish the contents of the specified "file". #>


# The path must be enclosed in braces because normal files paths include special characters like ":" and "\", which PowerShell can misinterpret

# The "`" character in front of the first "$", by the way, is not a typo but a
# character as it's known as the "backtick" character. You specify it in front of
# all characters that normally have a special meaning that you want to override
# during the current operation.  PAGE 74 https://www.bonusbits.com/uploads/Mastering-PowerShell.pdf
$command = "`${$env:windir\PFRO.log}"
Invoke-Expression $command
#$command

"Result = $(2+2)"


# Get file:
$file = "`${$env:windir\PFRO.log}"
# File size given by length property:
$file.length
# To embed the file size in text, ad hoc variables are required:
"The size of the file is $($file.Length) bytes."


New-Variable a -value 1 -option Constant
"Value: $a"


# The variable will be created only in the current scope and not
# passed to other scopes. Consequently, it can only be read and
# written in the current scope.
$private:testscope = 1 



# Variables will be created only in the local scope. That is the
# default for variables that are specified without a scope. Local
# variables can be read from scopes originating from the current
# scope, but they cannot be modified.
$local:testscope= 1

# The variable is valid only in a script, but valid everywhere in it.
# Consequently, a function in a script can address other variables,
# which, while defined in a script, are outside the function.
$script:testscope= 1


# The variable is valid everywhere, even outside functions and
# scripts.
$global:testscope= 1


$testscope = 1
$local:testscope

$script:testscope = 12
$global:testscope
$private:testscope


# Define test function:
Function fntest { 
    "variable = $x"; 
    $x = 1000; 
}
# Create variable in console scope and call test function:
$x = 12
fntest
# After calling test function, control modifications in console scope:
$x

#########
Function fntest { 
    "variable = $x"; 
    $global:x = 1000; 
}
# Create variable in console scope and call test function:
$x = 12
fntest
# After calling test function, control modifications in console scope:
$x


###Variable Types and "Strongly Typing"
(12).GetType().Name
(1000000000000).GetType().Name
(12.5).GetType().Name
(12d).GetType().Name
("H").GetType().Name
(Get-Date).GetType().Name

[Byte]$flag = 12
$flag.GetType().Name

$date = "November 12, 2004"
$date


[datetime]$date = "November 12, 2004"
$date
$date.AddDays(-60)



# PowerShell stores a text in XML format as a string:
$t = "<servers><server name='PC1' ip='10.10.10.10'/>" +  "<server name='PC2' ip='10.10.10.12'/></servers>"
$t

# If you assign the text to a data type[xml], you'll
# suddenly be able to access the XML structure:
[xml]$list = $t
$list.servers

$list.servers.server


# Even changes to the XML contents are possible:
$list.servers.server[0].ip = "10.10.10.11"
$list.servers


# The result could be output again as text, including the
# modification:
$list.get_InnerXML()


$email = "george.campanis@nscc.ca"
$v = Get-Variable email
$pattern = "\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b"
$v.Attributes.Add($(New-Object `System.Management.Automation.ValidatePatternAttribute  -argumentList $pattern))

$email = "valid@email.ca"

$email = "invalid@email"