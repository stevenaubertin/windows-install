# Create some directories
function CreateDirectory([string]$directorypath, [switch]$verbose){
    if($verbose){
        Write-Host "Creating directory $directorypath"
        mkdir $directorypath -Verbose
    }
}
CreateDirectory("$env:USERPROFILE\repo")

# Install Chocolatey
#Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

# Update
choco upgrade chocolatey
python -m pip install --upgrade pip

# Dependencies
choco install jre8
choco install dotnet

# Terminal
choco install microsoft-windows-terminal
choco install ntop.portable
choco install grep
choco install powershell-core
choco install Less
choco install rclone
choco install rsync
pip install pygments

# Utilities
choco install git
choco install 7zip.install
choco install windirstat
choco install sublimetext3
choco install sublimemerge

# Browser
choco install googlechrome
choco install brave

# Docker
choco install docker-desktop
choco install docker-compose
choco install docker-cli