#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.default['number']="fifth"

package "httpd" do
	action :install
end

template "/var/www/html/index.html" do
	source "index.html.erb"
	notifies :restart, 'service[httpd]', :immediately 
end


service "httpd" do
	action :nothing 
end
