# Windows-Refresher
A lightweight, automated Windows tool to clean up your system, check and repair image health (DISM), fix corrupted system files (SFC), install all available software updates, and perform full Windows OS updates.
-

🧹 Windows Refresher is a lightweight tool I built to help maintain and optimize Windows systems. It performs essential cleanup tasks and health checks, including:
-
-🧼 Cleaning up temporary and unnecessary files

-🩺 Checking Windows image health and repairing issues (DISM)

-🔧 Scanning and repairing system file corruption (SFC)

-🔄 Installing all available software updates

-🪟 Performing full Windows OS updates

A handy all-in-one script to keep your Windows machine running smoothly and up to date.


How to use it ?  
-


Once you got the full repo, you simply have to double click on ![image](https://github.com/user-attachments/assets/e8fb51cc-0c70-4117-9875-06bb5f932c38)
to launch the script.
You will be able to follow what is going on by checking on the terminal window (the progress)

The only part that is not fully automated is the disk cleaner tool that require manually selecting what you want.

once the script is fully done you will get this pop up that will ask you to reboot and tell you everything is sucessfull. ENJOY
-
![image](https://github.com/user-attachments/assets/7eac3eeb-db5d-43da-88fd-cde219623167)

🛠 Script step by step
-
1. Update Installed Applications
Use winget to automatically check for and install updates for all installed software.

2. Scan for System File Corruption
Run sfc /scannow to detect and repair any corrupted or missing system files.

3. Check Windows Image Health
Use DISM to scan and restore the health of the Windows system image.

4. Run PowerShell Update Script
Launch a PowerShell script that:

Installs the NuGet provider (if not already installed).

Automatically downloads and installs pending Windows Updates.

5. Open Disk Cleanup Utility
Launch the built-in Windows Disk Cleanup Tool to free up system space.

6. Prompt for Reboot (XAML Menu)
Display a simple XAML-based menu at the end:

Notifies the user that the maintenance script has completed.

Offers an option to reboot the computer.
