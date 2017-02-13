#
# Cookbook Name:: varapp
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
node.default['apache']['port']=8090

['httpd','git'].each do |pack|

package "#{pack}" do
	action :install
	not_if "rpm -qa | grep -i ^#{pack}"
end

end
template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[httpd]",:immediately
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
end

bash "download" do
	code <<-EOH
	cd /usr/local/src
	git clone #{node['apache']['url']}
	EOH
	not_if "[[ -d /usr/local/src/docker ]]"
end



service "httpd" do
	action :start
end



