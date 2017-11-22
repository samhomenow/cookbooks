#
# Cookbook:: 8apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "httpd" do
	action :install
end


file "/var/www/html/index.html" do
	content '
	I am praveen'
end

service "httpd" do
	action :restart
end

