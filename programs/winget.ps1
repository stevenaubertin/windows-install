Write-Host "Installing WinGet PowerShell module from PSGallery..."  -ForegroundColor Green
Install-PackageProvider -Name NuGet -Force | Out-Null
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null

Write-Host "Using Repair-WinGetPackageManager cmdlet to bootstrap WinGet..."  -ForegroundColor Green
Repair-WinGetPackageManager
Write-Host "✓ Installing Winget done" -ForegroundColor Green
