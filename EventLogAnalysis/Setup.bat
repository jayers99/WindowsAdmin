rem to setup the remote firewall for remote eventlog viewing

for %i in (%MachineList%) do d:\util\sysinternals\psexec \\%i netsh advfirewall firewall set rule group="Remote Event Log Management" new enable=Yes

for %i in (d:\EventLogs\Lists\Channels\*.txt) do d:\util\sysinternals\psexec \\%~ni netsh advfirewall firewall set rule group="Remote Event Log Management" new enable=Yes

d:\util\sysinternals\psexec \\SOMESERVERNAME netsh advfirewall firewall set rule group="Remote Event Log Management" new enable=Yes