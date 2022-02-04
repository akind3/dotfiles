// 安装nerd字体
scoop bucket add nerd-fonts
sudo scoop install  Cascadia-Code CascadiaCode-NF-Mono  CascadiaCode-NF

// 安装 posh-git oh-my-posh 
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck

#安装 jump.location(类似linux上的j的跳转功能)
Install-Module Jump.Location -Scope CurrentUser
# 安装 psfzf, 这个模块包装了fzf
Install-Module -Name PSFzf -Scope CurrentUser

// 编辑powershell配置文件
vim $profile
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Jump.Location
Import-Module PSReadLine
Import-Module PSFzf
Set-PoshPrompt -Theme paradox


// terminal settings.json
{
    // Make changes here to the powershell.exe profile.
    "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
    "name": "Windows PowerShell",
    "commandline": "powershell.exe",
    "fontFace": "Cascadia Code PL",
    "hidden": false
},

// 查看,设置执行策略
// Get-ExecutionPolicy
// Get-ExecutionPolicy -List
// Get-ExecutionPolicy -Scope CurrentUser
// Set-ExecutionPolicy -ExecutionPolicy <PolicyName>
// Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
// Set-ExecutionPolicy -ExecutionPolicy <PolicyName> -Scope <scope>
// Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser