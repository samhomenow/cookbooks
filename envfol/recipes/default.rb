#
# Cookbook Name:: envfol
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

directory "/#{node['server']['folder']}" do
	owner 'root'
	group 'root'
end
