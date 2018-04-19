rem create a list of machines
set MachineList="mybox","mybox2"

rem set all the channels you want to collect
set ChannelList="Active Directory Web Services","ADAM (VMwareVCMSDS)","Application","DFS Replication","HardwareEvents","Key Management Service","Microsoft-IIS-Configuration/Administrative","Microsoft-Windows-Application Server-Applications/Admin","Microsoft-Windows-Dhcp-Client/Admin","Microsoft-Windows-DhcpNap/Admin","Microsoft-Windows-Dhcpv6-Client/Admin","Microsoft-Windows-Diagnosis-Scripted/Admin","Microsoft-Windows-EnrollmentPolicyWebService/Admin","Microsoft-Windows-EnrollmentWebService/Admin","Microsoft-Windows-Kernel-EventTracing/Admin","Microsoft-Windows-MUI/Admin","Microsoft-Windows-PrintService/Admin","Microsoft-Windows-RemoteApp and Desktop Connections/Admin","microsoft-windows-RemoteDesktopServices-RemoteDesktopSessionManager/Admin","Microsoft-Windows-TerminalServices-ClientUSBDevices/Admin","Microsoft-Windows-TerminalServices-LocalSessionManager/Admin","Microsoft-Windows-TerminalServices-PnPDevices/Admin","Microsoft-Windows-TerminalServices-RemoteConnectionManager/Admin","SolarWinds.Net","Symantec Endpoint Protection Client","Symantec Endpoint Protection Manager","Symantec Enterprise Vault","Symantec Enterprise Vault Converters","System","TFTPServiceEventLog","Windows PowerShell","Microsoft Web Deploy"

echo ^<?xml version="1.0" encoding="UTF-8"?^> > Logs.xml
echo ^<Events^> >> Logs.xml
for %j in (%MachineList%) do for %i in (%ChannelList%) do wevtutil qe %i /r:%j /q:"*[System[(Level=1 or Level=2 or Level=3) and (EventID!=1105 and EventID!=1111 and EventID!=56 and EventID!=7034 and EventID!=36 and EventID!=1530 and EventID!=47) and TimeCreated[@SystemTime>='2016-08-01T08:00:00.000Z']]]" >> Logs.xml
echo ^</Events^> >> Logs.xml
"d:\util\bcFileUtils\FiXML.exe" Logs.xml
d:\util\msxsl Logs.xml.fixed "EventLog.xsl" > logs.html