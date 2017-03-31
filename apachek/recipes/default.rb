#
# Cookbook:: apachek
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

fileandfolder=`ls /etc | wc -l`

node.default['port']=9090


package "httpd" do
	action :install
	not_if "rpm -qa | grep -i httpd"
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	variables(
	:filecount => fileandfolder
	)
	notifies :restart,"service[httpd]",:immediately 
end


service "httpd" do
	action :nothing
end



