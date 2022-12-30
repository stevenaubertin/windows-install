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
python -m pip install --upgrade pip

# Dependencies
choco install jre8
choco install dotnet

# Database
choco install sql-server-express
#choco install postgresql

# IDE
choco install vscode
choco install azure-data-studio
choco install visualstudio2022community

# Browser
choco install googlechrome
choco install brave

# Audio
choco install audacity
choco install asio4all

# Media
choco install vlc
choco install spotify
choco install ffmpeg

# Gaming
choco install steam
#choco install battle.net
#choco install epicgameslauncher

# Utils
choco install microsoft-windows-terminal
choco install git
choco install github-desktop
choco install greenshot
choco install 7zip.install
choco install sublimetext3
choco install sublimemerge
choco install postman
choco install rufus
choco install irfanview
choco install windirstat
choco install rpi-imager
choco install virtualbox
choco install ntop.portable
choco install powertoys
choco install powershell-core
choco install grep
choco install Less
choco install devtoys
pip install pygments

# Storage
#choco install dropbox
#choco install googledrive
choco install megasync

# Communication
choco install slack
choco install discord
choco install signal

# Torrent
choco install transmission
choco install webtorrent-desktop

# Docker
choco install docker-desktop
choco install docker-compose
choco install docker-cli

# Network
choco install openvpn

# Clone some repositories
