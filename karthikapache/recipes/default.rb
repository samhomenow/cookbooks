#
# Cookbook Name:: karthikapache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "httpd" do
	action :install
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
end


file "/var/www/html/index.html" do
	content " The file got generated through chef
	 I am running under the port #{node['port']}"
end

service "httpd" do
	action :restart
end

