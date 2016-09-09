#
# Cookbook Name:: oscarapache
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

directory "#{node['server']['rootvol']}" do
	owner 'root'
	group 'root'
	recursive true
end

directory "#{node['server']['certlocation']}" do
	owner 'root'
	group 'root'
	recursive true
end

oscarapache_packs "extract" do
	localtar "/root/cert.tar.gz"
	tarlink "http://ansiblepearson.cloudapp.net/cert.tar.gz"
	certlocation "#{node['server']['certlocation']}"
	action :create
end

service "httpd" do
	action :nothing
end


template "/etc/httpd/conf.d/prodatssl.conf" do 
	source "oscar-ssl.erb"
	notifies :restart, 'service[httpd]', :delayed
end


