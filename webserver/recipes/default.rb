#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
	action :install
	not_if "rpm -qa  | grep -i httpd"
end

template "/var/www/html/index.html" do
	source "index.erb"
	notifies :restart,'service[httpd]',:immediately
end

directory "/var/www/html/home" do
	owner 'apache'
	group 'apache'
	mode '0755'
end


cookbook_file "/var/www/html/home/index.html" do
	source "index.html"
	owner 'apache'
	group 'apache'
	mode '0755'
end

service "httpd" do
	action :nothing
end
