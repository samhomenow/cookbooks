#
# Cookbook Name:: envtest
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute "creating a file" do
	command "touch /tmp/#{node['phone']}"
end

puts node['phone']

directory "/tmp/#{node['phone']}" do
	owner 'root'
end

template "/tmp/sam" do
	source "sam.erb"
end

puts node['phone12']
