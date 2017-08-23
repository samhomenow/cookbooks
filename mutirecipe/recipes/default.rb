#
# Cookbook:: mutirecipe
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

directory "/tmp/#{node['folder']}" do
	action :create 
	owner 'root'
	group 'root'
end
