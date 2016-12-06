#
# Cookbook Name:: sriweb
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
  
package "httpd" do
	action :install
	not_if "rpm -qa | grep -i httpd"
end

file "/var/www/html/index.html" do
	content "Hi  This is Praveen
	"
	notifies :restart,'service[httpd]',:delayed
end

service "httpd" do
	action [:enable,:start]
end
