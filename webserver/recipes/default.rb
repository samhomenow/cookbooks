#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

class ::Chef::Recipe
  include ::Helpers
end

package "httpd" do
	action :install
	not_if "rpm -qa  | grep -i httpd"
end

template "/var/www/html/index.html" do
	source "index.erb"
	notifies :restart,'service[httpd]',:immediately
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,'service[httpd]',:immediately
end

#directory_creation("/var/www/html/home")
log "hiiii"
foldercreate "through definition" do
#	foldername "/var/www/html/home"
end


cookbook_file "/var/www/html/home/index.html" do
	source "index.html"
	owner 'apache'
	group 'apache'
	mode '0755'
end

service "httpd" do
	action :nothing
end
