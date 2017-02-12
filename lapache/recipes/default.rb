#
# Cookbook Name:: lapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node.default['apache']['port']=8080

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i httpd" 
end

cookbook_file "/var/www/html/index.html" do
	source "index.html" 
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[httpd]",:immediately 
end


service "httpd" do	
	action :start
end
	
