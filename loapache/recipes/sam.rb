#
# Cookbook:: loapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['port']=9090

case node['platform']

 when 'ubuntu'
    pack="apache2"

 when 'redhat','centos'
    pack="httpd"

end


package pack do
	action :install
	not_if "rpm -qa | grep -i #{pack}"
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
	notifies :restart,"service[#{pack}]",:immediately
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	owner 'root'
	group 'root'
	notifies :restart,"service[#{pack}]",:immediately
end



service "#{pack}" do
	action :nothing
end


