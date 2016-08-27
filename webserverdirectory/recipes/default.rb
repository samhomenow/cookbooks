#
# Cookbook Name:: webserverdirectory
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/var/www/html/class" do
	action :create
	owner 'apache'
	group 'apache'
	mode '0755'
end

file "/var/www/html/class/index.html" do
	content 'this file under class'
	owner 'apache'
	group 'apache'
end

service "httpd" do
	action :restart
end
