#
# Cookbook Name:: evening
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


package "httpd" do
	action :install
end

file "/var/www/html/index.html" do 
	content "
	This is praveen from Pearson
	"
end

service "httpd" do
	action :restart
end
