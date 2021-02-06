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

# Update/Upgrade
choco upgrade chocolatey
python -m pip install --upgrade pip

# Dependencies
choco install jre8
choco install dotnet
choco install sql-server-express
choco install postgresql
pip install tvnamer

# Media
choco install vlc
choco install plex
choco install ffmpeg
choco install radarr
choco install sonarr

# Utils
choco install microsoft-windows-terminal
choco install git
choco install 7zip.install
choco install windirstat
choco install virtualbox

# Storage
choco install dropbox
choco install googledrive
choco install megasync

# Torrent
choco install transmission
choco install webtorrent-desktop

# Docker
choco install docker-desktop
choco install docker-compose
choco install docker-cli

# Audio
choco install asio4all
choco install picard
choco install eac
