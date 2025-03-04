# From https://chocolatey.org/install
try {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));
    choco upgrade chocolatey

    Write-Host "✓ Installing Chocolatey done" -ForegroundColor Green
}
catch {
    Write-Host "✗ Installing Chocolatey Failed " -ForegroundColor Red
}
