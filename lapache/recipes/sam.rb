#
# Cookbook Name:: lapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node.default['apache']['port']=8090

case node['platform']

	when /cent.*/,/redhat/

	pack="httpd"

	when /ubuntu/
	
	pack="apache2"
end


package pack do
	action :install
	not_if "rpm -qa | grep -i #{pack}" 
end

cookbook_file "/var/www/html/index.html" do
	source "index.html" 
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[httpd]",:immediately 
end


service "httpd" do	
	action :start
end
	
