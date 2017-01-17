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
	Hi Krishna
	this is my chef"
end

service "httpd" do
	action :restart
end
