#
# Cookbook Name:: webapps
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
	action :install
	not_if "rpm -qa  | grep -i http"
end

template "/etc/httpd/conf/httpd.conf" do
	source "apache.erb"
	notifies :restart, 'service[httpd]', :delayed 
end

template "/var/www/html/index.html" do
	source "index.erb"
	notifies :restart, 'service[httpd]', :delayed
end

service "httpd" do
	action :nothing 
end
