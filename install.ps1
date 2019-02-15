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
CreateDirectory("$env:USERPROFILE/repo")

# 
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install programs
choco upgrade chocolatey

choco install jre8
choco install 7zip.install
choco install googlechrome
choco install brave
choco install vlc
choco install spotify
choco install visualstudiocode
choco install visualstudio2017enterprise
choco install greenshot
choco install steam
choco install dropbox
choco install googledrive
choco install docker
choco install slack
choco install battle.net
choco install webtorrent-desktop
choco install plexmediaserver

# Streamlink
choco install streamlink
choco install streamlink-twitch-gui