#
# Cookbook Name:: apacheserver
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

##httpd package install
 
package "httpd" do
	action :install
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
end

service "httpd" do
	action :restart
end


