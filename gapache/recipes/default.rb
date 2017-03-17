#
# Cookbook:: gapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#node.default['port']=2020

fol=`ls /etc/ | wc -l`

package "httpd" do
	action :install
	not_if "rpm -qa | grep httpd"
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
	owner 'root'
	group 'root'
	mode '0644'
	notifies :restart,"service[httpd]",:immediately
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb" 
	notifies :restart,"service[httpd]",:immediately
	owner 'root'
	group 'root'
	variables(
	:fol_new => fol
	)
end

service "httpd" do
	action :nothing
end


##Collecting list of machines which has the tag name as apache


search("node","tags:apache").each do |a|

log "Name of the machine which has the tag name as apache: #{a}"

puts a

end







