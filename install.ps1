Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

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

#choco install dotnetcore
#choco install dotnetcore-sdk
#choco install dotnet4.7
#choco install nunit.install
