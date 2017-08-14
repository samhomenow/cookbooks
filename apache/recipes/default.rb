#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

y=`whoami`

node.override['port']=9090

case node['platform']
	
	when /ceNt.*s/i,'redhat','fedaro'
		pack="httpd"
	
	when "debien","ubuntu"
		pack="apache2"
	
end

package "#{pack}" do	
	action :install
	not_if "rpm -qa | grep -i #{pack}"
end


cookbook_file "/var/www/html/index.html" do
	source "index.html"
end


template "/etc/httpd/conf/httpd.conf" do
         source "httpd.conf.erb"
	 variables({
	 :owner => y
	 })
	 notifies :restart,"service[#{pack}]",:delayed
end


service "#{pack}" do
	action :start 
end

include_recipe "apache::sam"

	
