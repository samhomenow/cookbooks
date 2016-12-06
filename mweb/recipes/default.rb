#
# Cookbook Name:: mweb
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "httpd"  do
	action :install 
	not_if "rpm -qa | grep -i http"
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
	owner 'root'
	group 'root'
	notifies :restart,'service[httpd]',:delayed
end



service "httpd" do
	action :start
end
