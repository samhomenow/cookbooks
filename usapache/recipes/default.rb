#
# Cookbook Name:: usapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i http"
end

file "/var/www/html/index.html" do
	content "
	This is first class"
end


service "httpd" do
	action :restart
end


