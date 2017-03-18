#
# Cookbook:: multienv
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "httpd" do
	action :install
end

cookbook_file "/var/www/html/index.html" do
	source node['filename']
	notifies :restart,"service[httpd]",:immediately
end

service "httpd" do
	action :nothing
end
