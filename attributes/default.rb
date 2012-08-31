case node['platform']
when "smartos"
  default[:snmp][:dir]                      = '/opt/local/etc'
  default[:snmp][:service_name]             = 'snmp'
else
  default[:snmp][:dir]                      = '/etc/snmp'
  default[:snmp][:service_name]             = 'snmpd'
end
default[:snmp][:syslocation]              = "Joyent"
default[:snmp][:syscontact]               = "sysops@modcloth.com"
default[:snmp][:rocommunity]              = "fR@55!NG"
default[:snmp][:rwcommunity]              = "private"
default[:snmp][:slash_disk_threshold]     = "80" #Percent
default[:snmp][:slash_tmp_disk_threshold] = "80" #Percent
