# Define the list of Microsoft Store app packages to install
$appPackages = @(
    "Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe",
    "Microsoft.WindowsCalculator_8wekyb3d8bbwe",
    "Microsoft.GetHelp_8wekyb3d8bbwe"
    # Add more app packages as needed
)

# Install each app
foreach ($appPackage in $appPackages) {
    Add-AppxPackage -Package $appPackage -Register
}

# Check if VLC is installed and reinstall if necessary
if (-not (Get-Command "vlc" -ErrorAction SilentlyContinue)) {
    # Replace "VLCInstaller.exe" with the actual installer file name
    Start-Process -FilePath "VLCInstaller.exe" -ArgumentList "/S" -Wait
}

# Check if Chrome is installed and reinstall if necessary
if (-not (Get-Command "chrome" -ErrorAction SilentlyContinue)) {
    # Replace "ChromeInstaller.exe" with the actual installer file name
    Start-Process -FilePath "ChromeInstaller.exe" -ArgumentList "/silent", "/install" -Wait
}
