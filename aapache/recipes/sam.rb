#
# Cookbook Name:: aapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

case node['platform']

when /centos/

package "httpd" do
	action :install
	not_if "rpm -qa | grep httpd"
end

when /ubuntu/

package "apache" do
	action :install
	not_if "rpm -qa | grep httpd"
end

end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
	notifies :restart,"service[httpd]",:delayed
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[httpd]",:delayed
end

service "httpd" do
	action :start
end
