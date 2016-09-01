#
# Cookbook Name:: host-entry
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
pool=search("node","role:#{node['server']['name']}")

pool.each do |a|

	puts a[:ipaddress]
	puts a[:hostname]

end
