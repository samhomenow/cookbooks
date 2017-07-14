#
# Cookbook:: sraapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


#node.default['port']=9090

case node['platform'] 

	when 'redhat','fedora','centos'
		pack="httpd"
	when 'ubuntu'
		pack="apache"
end



package "installing apache" do
	package_name "#{pack}"
	action :install
	not_if "rpm -qa | grep #{pack}"
end


cookbook_file "/var/www/html/index.html" do
	source "index.html"
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[#{pack}]",:immediately
end


service "#{pack}" do	
	service_name pack
	action :start
end

