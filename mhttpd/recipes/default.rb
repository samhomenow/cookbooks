#
# Cookbook Name:: mhttpd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

Chef::Config[:node_name]

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i httpd"
end

template "/var/www/html/index.html" do
	source "index.html.erb" 
	notifies :restart,"service[httpd]",:delayed
end

service "httpd" do
	action :nothing
end

bash "adding node name" do
	code <<-EOH
	mkdir /var/www/html/sub
	echo "i am from node #{node['fqdn']}" > /var/www/html/sub/index.html
	EOH
end

