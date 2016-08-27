#
# Cookbook Name:: webapplication
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
	action :install
end

template "/var/www/html/index.html" do
	source "index.erb" 
	notifies :restart,'service[httpd]',:immediately
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,'service[httpd]',:immediately

end


service "httpd" do
	action :nothing
end
