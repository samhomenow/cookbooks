#
# Cookbook Name:: mapache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "httpd" do
	action :install
	not_if "rpm -qa | grep httpd"
end


template "/var/www/html/index.html" do
	source "index.html.erb"
	notifies :restart,'service[httpd]',:delayed
end

service "httpd" do
	action :nothing
end
