#
# Cookbook:: gvapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

add=`ls /etc/ |wc -l`

node.default['port']=8090

['httpd','httpd-tools'].each do |pack|

	package  pack do
		action :install
		not_if "rpm  -q #{pack}"
	end

end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
    	notifies :restart,"service[httpd]",:delayed
end


template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb" 
	variables(
	"number" => add
	)
    	notifies :restart,"service[httpd]",:delayed
end

service "httpd" do
	action :nothing
end


