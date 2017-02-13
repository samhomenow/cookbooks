#
# Cookbook Name:: monapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node.default['apache']['port']=9090

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i http"
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


