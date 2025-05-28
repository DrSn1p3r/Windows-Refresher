# update-windows.ps1

# Check if NuGet provider is available, and if not, install it without user interaction
$nugetProvider = Get-PackageProvider -Name NuGet -ForceBootstrap
if ($nugetProvider -eq $null) {
    Install-PackageProvider -Name NuGet -Force -Scope CurrentUser
}

# Forcefully install the PSWindowsUpdate module without confirmation prompts
Install-Module PSWindowsUpdate -Force -Confirm:$false -Scope CurrentUser

# Import the module and perform updates
Import-Module PSWindowsUpdate
Get-WindowsUpdate -AcceptAll -Install


echo ""
echo "###############################################################"
echo "##           STEP 5: Windows Disk Cleaner Tools              ##"
echo "###############################################################"
echo ""
# Run the windows cleaner tools
Start-Process "cleanmgr.exe" -Wait

# Start a second PowerShell process that shows the message box
Add-Type -AssemblyName PresentationFramework

# Minimize the PowerShell window before showing the message box
$host.ui.RawUI.WindowTitle = "Disk Cleanup Script"
$host.ui.RawUI.WindowSize = New-Object Management.Automation.Host.Size(1,1)

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Success" Height="260" Width="440" WindowStartupLocation="CenterScreen" ResizeMode="NoResize">
    <Grid>
        <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center" Margin="10">
            <TextBlock Text="✅ Script was completed with success!" 
                       FontSize="18" FontWeight="Bold" Foreground="Green"
                       TextAlignment="Center" 
                       Margin="0,0,0,10"
                       TextWrapping="Wrap"/>
            <TextBlock Text="🛑 Please reboot the computer." 
                       FontSize="14" Foreground="Red"
                       TextAlignment="Center" 
                       Margin="0,0,0,5"
                       TextWrapping="Wrap"/>
            <TextBlock Text="⚠️ Check HP Support Assistant for HP Computers." 
                       FontSize="14" Foreground="Goldenrod"
                       TextAlignment="Center"
                       Margin="0,0,0,15"
                       TextWrapping="Wrap"/>
            <StackPanel Orientation="Horizontal" HorizontalAlignment="Center">
                <Button Name="OkButton" Width="100" Height="30" Margin="10">OK</Button>
                <Button Name="RebootButton" Width="100" Height="30" Margin="10">Reboot</Button>
            </StackPanel>
        </StackPanel>
    </Grid>
</Window>
"@

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$window.FindName("OkButton").Add_Click({
    $window.Close()
})

$window.FindName("RebootButton").Add_Click({
    Start-Process -FilePath "shutdown.exe" -ArgumentList "/r /t 0" -Verb RunAs
    $window.Close()
})

# Show the message box dialog
$window.ShowDialog() | Out-Null

# Exit the script and close the terminal
$host.SetShouldExit(0)
