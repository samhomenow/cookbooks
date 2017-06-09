#
# Cookbook:: sreapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "httpd" do
	action :install
end

file "/var/www/html/index.html" do
	content  "
	Welcome to devops class
	first
	"
end


service "httpd" do
	action :restart
end

