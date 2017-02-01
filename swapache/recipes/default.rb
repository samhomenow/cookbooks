#
# Cookbook Name:: swapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


case node['platform']

when /cent.*/i
   pack="httpd"

when /ubuntu/
   pack="apache"

end


package pack do
	action :install
	not_if "rpm -qa | grep -i #{pack}"
end


cookbook_file "/var/www/html/index.html" do
	source "index.html"
	notifies :restart,'service[httpd]',:delayed
end


service "httpd" do
	action [:start,:enable]
end
