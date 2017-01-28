#
# Cookbook Name:: kiranapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

case node['platform']

 when /ubuntu/
   log "You are inside apache"
   pack='apache'

 when /cent.*/
    log " you are under centos"
    pack='httpd'
 
end


package pack do
	action :install
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	owner 'root'
	group 'root'
	notifies :restart,'service[httpd]',:delayed
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
end

service 'httpd' do
	action ['enable','start']
end


