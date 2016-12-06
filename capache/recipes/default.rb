#
# Cookbook Name:: capache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "httpd" do
	action :install
end

template "/var/www/html/index.html" do
	source "apache.erb"
end

service "httpd" do
	action :restart
end

