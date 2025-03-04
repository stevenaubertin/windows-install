# Install python
try {
    choco install python
    Write-Host "✓ Installing Python Done" -ForegroundColor Green
}
catch {
    Write-Host "✗ Installing Python Failed" -ForegroundColor Green
}

# Update Package Manager
try {
    python -m ensurepip --upgrade
    python -m pip install --upgrade pip
    python get-pip.py
    pip --version
    Write-Host "✓ Updating Pip Done" -ForegroundColor Green
}
catch {
    Write-Host "✗ Updating Pip Failed " -ForegroundColor Red
}
