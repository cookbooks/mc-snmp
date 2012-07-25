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
end

package pkg do
  action :install
end

service "snmp" do
  action [ :enable, :start ]
end