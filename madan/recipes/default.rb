#
# Cookbook Name:: madan
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
	action :install
end

file "/var/www/html/index.html" do
	content "this is madan"
end

service "httpd" do
	action :restart
end