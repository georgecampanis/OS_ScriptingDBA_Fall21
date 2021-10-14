Get-Process | Sort-Object -Property CPU |  Select-Object -First 20 > lstProcess.txt

<#

F8 - runs selected text
F5 - runs all text
ctrl C will escape
use up and down arrows to scroll between prev commands
use tab in terminal to scroll/autocomplete e.g Get- <tab>
Esc removes current line
Use * as wildcards

use > to save/redirect
use >> to append
#>

cls # Clear screen
cd .. # back a dir
cd /. # root dir

### Using Help
help *process*
help Start-Process
help Start-Process -Full

dir # list directories could use ls too
ls

# DBA Class
###################################
#Piping and Routing
###################################

<#

Piping uses the vertical bar (|). The results of the command to the left of the pipe symbol are then
fed into the command on the right side of the pipe symbol. This kind of piping is also known in
PowerShell as the "pipeline":
#>
Get-Process | more 
dir | Sort-Object -property Length, Name
ls | Sort-Object -property LastWriteTime 
ls | Sort-Object -property LastWriteTime -Descending | Select-Object -Last 3


<#
Redirecting and saving results
#>

Help > "C:\temp\help.txt"

help Remove-Item #alias' ri,rm,rmdir,del,erase,rd

Remove-Item  "C:\temp\help.txt"

dir | Sort-Object -property Length, Name > dir.txt # redirect /save

dir
ls | Sort-Object -property LastWriteTime -Descending | Select-Object -Last 3 >>  dir.txt # append

notepad "C:\temp\help.txt"
notepad "C:\temp\lstProcess.txt"