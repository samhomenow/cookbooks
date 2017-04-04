#
# Cookbook:: apsri
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['port']=9091
number1=`ls /etc | wc -l`

package "httpd" do
	action :install 
	not_if "rpm -qa | grep -i httpd"
end

template "/var/www/html/index.html" do
	source "index.html.erb"
	variables(
	:number => number1
	)
end


template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[httpd]",:immediately
end


service "httpd" do	
	action :nothing
end

include_recipe "apsri::play"
