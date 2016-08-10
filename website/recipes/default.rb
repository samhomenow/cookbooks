#
# Cookbook Name:: website
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

## httpd installation

package "httpd" do
	action :install
end


## service start

service "httpd" do
	action :restart
end
