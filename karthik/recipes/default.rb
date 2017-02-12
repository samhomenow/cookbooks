#
# Cookbook Name:: karthik
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i httpd"
end


file "/var/www/html/index.html" do
	content "
	Hi this is karthick , morning class"
	
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
end


service "httpd" do
	action :restart
end
