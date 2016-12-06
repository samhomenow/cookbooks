#
# Cookbook Name:: gseapache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i http"
end

file "/var/www/html/index.html" do
	content "
	Hi this is second site"
	notifies :restart,'service[httpd]',:delayed
end

directory "/var/www/html/gse" do
	owner "root"
	group "root"
	mode '0755'
end

template "/var/www/html/gse/index.html" do
	source "index.html.erb"
	notifies :restart,'service[httpd]',:delayed
end


service "httpd" do
	action :nothing 
end


