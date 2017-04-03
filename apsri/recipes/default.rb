#
# Cookbook:: apsri
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['port']=9091

package "httpd" do
	action :install 
	not_if "rpm -qa | grep -i httpd"
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
end


service "httpd" do	
	action :restart
end
