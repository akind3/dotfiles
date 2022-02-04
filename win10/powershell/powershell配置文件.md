code $profile
```
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Jump.Location
Set-PoshPrompt -Theme paradox

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# auto suggestions
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

Set-Location c:\users\akint

function ssh_to_ubuntu{
   ssh akin@192.168.3.11
}
Set-Alias sshuu ssh_to_ubuntu
Set-Alias uu ssh_to_ubuntu
```