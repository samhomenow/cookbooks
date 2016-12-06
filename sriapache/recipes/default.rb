#
# Cookbook Name:: sriapache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i httpd"
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.erb" 
	notifies :restart,'service[httpd]',:delayed
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
	notifies :restart,'service[httpd]',:delayed
end


service "httpd" do
	action [:start,:enable]
end
