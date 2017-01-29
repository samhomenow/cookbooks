#
# Cookbook Name:: kapache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "httpd" do
	action :install
end

file "/var/www/html/index.html" do
	content "
	Hi sam
	this is my chef"
end

template "/tmp/kiran" do
	source "uttam.erb"
end

service "httpd" do
	action :restart
end
