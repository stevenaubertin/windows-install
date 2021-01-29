# Create some directories
function CreateDirectory([string]$directorypath, [switch]$verbose){
    if($verbose){
        Write-Host "Creating directory $directorypath"
        mkdir $directorypath -Verbose
    }
    else{
        mkdir $directorypath
    }
}
CreateDirectory("$env:USERPROFILE\repo")

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install programs
choco upgrade chocolatey

# IDE
choco install vscode
choco install visualstudio2017enterprise

# Browser
choco install googlechrome
choco install brave

# Dependencies
choco install jre8

# Media
choco install plexmediaserver
choco install vlc
choco install spotify

# Gaming
choco install steam
choco install battle.net

# Utils
choco install greenshot
choco install dropbox
choco install googledrive
choco install 7zip.install

# Communication
choco install slack

# Torrent
choco install transmission

# Vagrant
choco install vagrant

# Streamlink
choco install streamlink
choco install streamlink-twitch-gui
