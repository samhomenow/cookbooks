#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
 
package "httpd" do
	action :install
end

template "/var/www/html/index.html" do
	source "website.erb"
end

service "httpd" do
	action :restart
end
