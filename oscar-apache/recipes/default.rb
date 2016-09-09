#
# Cookbook Name:: oscar-apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node['package'].each do |pack|
	
	package pack do
		action :install
		not_if "rpm -qa | grep -i #{pack}"
	end

end

directory "#{node['prod']['certlocation']}" do
	owner 'root'
	group 'root'
	recursive true
end

oscar-apache_packs  do
	localtar "/root/cert.tar.gz"
	tarlink "http://ansiblepearson.cloudapp.net/chef.tar.gz"
	action :create
end

service "httpd" do
	action :nothing
end


template "/etc/httpd/conf.d/prodatssl.conf" do 
	source "oscar-ssl.erb"
	notifies :restart, 'service[httpd]', :delayed
end


