# Post-Reformat Guide for Windows

* Install any pending updates
* Download Google Chrome
* Set hostname

## MakeWindows10GreatAgain
https://github.com/clong/MakeWindows10GreatAgain

## Powershell
Copy [Profile.ps1](configs/Profile.ps1) to `C:\Windows\System32\WindowsPowerShell\v1.0`

## Choco
1. Install choco: `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`
2. `choco install git classic-shell`

## Ninite for packages
* Notepad++
* Putty
* Dropbox
* VLC
* Spotify 
* Steam
* WinRAR
* SumatraPDF
* WinDirStat
* Discord
* Slack

## Security
* 1password
* Glasswire
* Wireshark
* Nmap

## Utilities
* Flux
* Nvidia drivers
* Printer drivers

## Multimedia
* Photosync

## Developer
* [VSCode](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
* [Windows Terminal](configs/settings.json)


