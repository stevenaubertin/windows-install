function Check-Dependencies {
    param (
        [string]$filePath
    )

    $config = Get-Content $filePath | ConvertFrom-Json

    foreach ($dep in $config.dependencies) {
        Write-Host "Checking dependency: $($dep.name)" -ForegroundColor Cyan
        
        # Execute test command
        foreach ($test in $dep.test) {
            try {
                $result = Invoke-Expression $test 2>&1
                
                # Check if command was successful
                if ($LASTEXITCODE -eq 0) {
                    Write-Host "✓ Test command successful: $test" -ForegroundColor Green
                    
                    # Version check
                    if ($dep.version.Count -gt 0) {
                        foreach ($versionConstraint in $dep.version) {
                            if (Test-PythonVersion -versionConstraint $versionConstraint -actualVersion $result) {
                                Write-Host "✓ Version requirement met: $versionConstraint" -ForegroundColor Green
                            } 
                            else {
                                Write-Host "✗ Version requirement not met: $versionConstraint" -ForegroundColor Red
                                Write-Host "Current version: $result" -ForegroundColor Yellow
                                return $false
                            }
                        }
                    }
                } 
                else {
                    Write-Host "✗ Test command failed: $test" -ForegroundColor Red
                    Write-Host "Error: $result" -ForegroundColor Yellow
                    return $false
                }
            } 
            catch {
                Write-Host "✗ Error executing test command: $test" -ForegroundColor Red
                Write-Host "Error: $_" -ForegroundColor Yellow
                return $false
            }
        }
    }
    return $true
}

function Test-PythonVersion {
    param (
        [string]$versionConstraint,
        [string]$actualVersion
    )
    
    # Extract the operator and version number
    if ($versionConstraint -match '([>=<]+)(\d+)') {
        $operator = $matches[1]
        $requiredVersion = [int]$matches[2]
        
        # Extract actual version number (assuming format like "Python 3.x.x")
        if ($actualVersion -match 'Python (\d+)') {
            $currentVersion = [int]$matches[1]
            
            # Compare versions based on operator
            switch ($operator) {
                '>=' { return $currentVersion -ge $requiredVersion }
                '>'  { return $currentVersion -gt $requiredVersion }
                '<=' { return $currentVersion -le $requiredVersion }
                '<'  { return $currentVersion -lt $requiredVersion }
                '='  { return $currentVersion -eq $requiredVersion }
                default { return $false }
            }
        }
    }
    return $false
}

# Main execution
Write-Host "Checking dependencies for $($config.file)" -ForegroundColor Cyan
$result = Check-Dependencies @args

if ($result) {
    Write-Host "`nAll dependency checks passed!" -ForegroundColor Green
} 
else {
    Write-Host "`nSome dependency checks failed. Please review the errors above." -ForegroundColor Red
    exit 1
}
