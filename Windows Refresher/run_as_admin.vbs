Set shellApp = CreateObject("Shell.Application")
Set fso = CreateObject("Scripting.FileSystemObject")
scriptPath = fso.GetParentFolderName(WScript.ScriptFullName)
batchFile = Chr(34) & scriptPath & "\mainscript.bat" & Chr(34)
shellApp.ShellExecute "cmd.exe", "/c " & batchFile, "", "runas", 1