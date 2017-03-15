#
# Cookbook:: sriniapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "httpd" do
	action :install
end

file "/var/www/html/index.html" do
       content "
       This is my third site"
end


service "httpd" do
	action :restart
end


