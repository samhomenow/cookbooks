#
# Cookbook:: mutirecipe
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['folder']="iamfromrecipe"

directory "/tmp/#{node['folder']}" do
	action :create 
	owner 'root'
	group 'root'
end
