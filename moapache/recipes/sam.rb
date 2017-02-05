#
# Cookbook Name:: moapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node.default['server']['port']='7080'


case node['platform']
	
	when /cant.*/i
		pack="httpd"
	
	when /ubuntu.*/i
		pack="apache2"
	else 
		log "not matching with mentioned os"
end

if pack=~/\w+/i
		


package pack do
	action :install
	not_if "rpm -qa | grep #{pack}"
end




cookbook_file "/var/www/html/index.html" do
	source "index.html"
end

node['server']['folder'].each do |foldername,filename|
	 
	 directory "/var/www/html/#{foldername}" do
	 	end
	 file "/var/www/html/#{foldername}/#{filename[:name]}" do
	 	content "This is #{filename[:name]}"
   	 end

end
	 



template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[httpd]",:delayed
end

service "httpd" do
	action [:enable,:start]
end

end

