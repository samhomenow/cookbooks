#
# Cookbook Name:: basentappsubdir
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/var/www/html/class" do
	owner "apache"
	group "apache"
	mode "0755"
end

file "/var/www/html/class/index.html" do
	content "I am inside class"
	owner "apache"
	group "apache"
end

service "httpd" do
	action :restart
end
