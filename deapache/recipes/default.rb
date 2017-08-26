#
# Cookbook:: deapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

name=`hostname`

time=`date`

node.default['port']=9090

case node['platform']

	when /cent.*/i,"redhat"
		pack="httpd"

	when "ubuntu"
		pack="apache2"
end


package pack do
	action :install
	not_if "rpm -qa | grep -i #{pack}"
end

template "/var/www/html/index.html" do
	source "index.html.erb"
	variables({
	:name => name,
	:time => time
	})
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[#{pack}]",:delayed
end

service pack do
	action :start
end

