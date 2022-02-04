code $profile
```
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Jump.Location

# auto suggestions
Import-Module PSReadLine

Import-Module PSFzf

Set-PoshPrompt -Theme paradox

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -PredictionSource History

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location } 
Set-PsFzfOption -AltCCommand $commandOverride

Set-Location c:\users\akint

function ssh_to_ubuntu{
   ssh akin@192.168.3.11
}
Set-Alias sshuu ssh_to_ubuntu
Set-Alias uu ssh_to_ubuntu

# Get-ChildItem . -Recurse -Attributes Directory | Invoke-Fzf | Set-Location

# Get-ChildItem . -Recurse -Attributes !Directory | Invoke-Fzf | % { notepad $_ }

# example command - use $Location with a different command:
# Set-Location (Get-ChildItem . -Recurse | ? { $_.PSIsContainer } | Invoke-Fzf) # This works as of version 2.2.8
# Get-ChildItem . -Recurse | ? { $_.PSIsContainer } | Invoke-Fzf | Set-Location
```