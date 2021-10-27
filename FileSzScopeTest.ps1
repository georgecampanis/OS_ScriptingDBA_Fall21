dir Variable: | Format-Table  Name, Value, options  >> C:\temp\vars.txt
$file = dir "C:\temp\vars.txt"
$flSizeText="The size of the file is $([Math]::Round($file.Length/1KB,3)) kilobytes."