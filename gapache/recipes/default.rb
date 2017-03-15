#
# Cookbook:: gapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "httpd" do
	action :install
	not_if "rpm -qa | grep httpd"
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
	owner 'root'
	group 'root'
	mode '0644'
	notifies :restart,"service[httpd]",:immediately
end


service "httpd" do
	action :start
end



