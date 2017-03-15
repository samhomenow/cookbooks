#
# Cookbook:: firstapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "httpd" do
	action :install
end

file "/var/www/html/index.html"  do 
	content "
	welcome to india
	"
end

service "httpd" do
	action :restart
end
