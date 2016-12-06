#
# Cookbook Name:: hosts
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node['server']['linux'].each do |hostname,ipaddress|

template "/tmp/#{hostname}" do
 
      source "hosts.erb"
      variables(
      :serverip => ipaddress["ip"],
      :servername => hostname
      )

end

end

