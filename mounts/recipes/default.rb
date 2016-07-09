#
# Cookbook Name:: mounts
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

execute "sam" do
	command "mount -a" 
end

log "`cat /etc/passwd`"
