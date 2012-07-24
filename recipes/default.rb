#
# Cookbook Name:: snmp
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'snmp' do
  action :install
end

service "snmp" do
  action [ :enable, :start ]
end