#
# Cookbook Name:: node223apache
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
	content "
	Hi
	This 
	is 
	my 
	first 
	"
	notifies :restart,"service[httpd]",:delayed
end

service "httpd" do
	action :nothing
end
