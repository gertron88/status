# Quick script to push STATUS.md updates to the dashboard
# Run from workspace root: .\projects\status-dashboard\update.ps1

$sourceFile = "STATUS.md"
$destDir = "projects\status-dashboard"
$destFile = "$destDir\STATUS.md"

# Copy the latest STATUS.md
Copy-Item $sourceFile $destFile -Force

# Commit and push
Push-Location $destDir
git add STATUS.md
git commit -m "Update status $(Get-Date -Format 'yyyy-MM-dd HH:mm')" 2>$null
git push origin main
Pop-Location

Write-Host "Status dashboard updated!" -ForegroundColor Green
