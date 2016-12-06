#
# Cookbook Name:: usercreation
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i httpd"
end

file "/var/www/html/index.html" do
	content "
	Hi this is #{node['username']}
	added new line
	"
	notifies :restart,"service[httpd]",:delayed
end

directory "/var/www/html/naren" do
	owner 'root'
	group 'root'
	mode '0755'
end

template "var/www/html/naren/index.html" do
	source "index.html.erb"
	notifies :restart,"service[httpd]",:delayed
end

service "httpd" do
	action :nothing
end
