#
# Cookbook Name:: sowapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


s=`ls | wc -l`

template "/tmp/samh" do
	source "sam.erb"
	variables(
	:total_files => s
	)
end




node.default['apache']['port']=14000

package "httpd" do
	action :install
	not_if "rpm -qa |  grep -i httpd"
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
end


template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[httpd]",:immediately
end

service "httpd" do
	action :start
end
