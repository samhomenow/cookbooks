#
# Cookbook Name:: kapache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node.default['class']['chennai']['morning']="chef"
node.default['class']['chennai']['evening']="kranthi"

log "#{node['sam']}"

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i http"
end

file "/var/www/html/index.html" do
	content "
	Hi sam
	this is my chef"
end

template "/tmp/kiran" do
	source "uttam.erb"
	notifies :restart,'service[httpd]',:delayed
end

service "httpd" do
	action :start
end

node['class']['chennai'].each do |session,value|
	
	if session =~ /Eve.*/i
		log "Hi , the vaule is -=>  #{value}"
	end

end
