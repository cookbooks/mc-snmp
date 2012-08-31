#
# Cookbook Name:: snmp
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node['platform']
when 'smartos'
  pkg = 'net-snmp'
else
  pkg = 'snmpd'
end

package pkg do
  action :install
end

service node[:snmp][:service_name] do
  action [ :enable, :start ]
end

template "#{node[:snmp][:dir]}/snmpd.conf" do
  source "snmpd.conf.erb"
  mode "0644"
  variables(
      :syslocation => node[:snmp][:syslocation],
      :syscontact => node[:snmp][:syscontact],
      :rocommunity => node[:snmp][:rocommunity],
      :rwcommunity => node[:snmp][:rwcommunity],
      :slash_disk_threshhold => node[:snmp][:slash_disk_threshold],
      :slash_tmp_disk_threshold => node[:snmp][:slash_tmp_disk_threshold]      
    )
  notifies :restart, "service[#{node[:snmp][:service_name]}]"
end