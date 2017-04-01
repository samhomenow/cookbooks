#
# Cookbook:: rajnish
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['port']=7070

package "httpd" do
	action :install
end


file "/var/www/html/index.html" do
	content "
	I am Rajnish from Devops"
end


template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
end

service "httpd" do
	action :restart
end


