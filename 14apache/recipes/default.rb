#
# Cookbook:: 14apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
node.override['port']=9090

case node['platform']

   when /cent.*/i,"redhat","fedaro"
   	pack="httpd"

   when "ubuntu","debien"
   	pack="apache2"

end


package pack do
	action :install
	not_if "rpm -qa | grep #{pack}"
end


template "/var/www/html/index.html" do
	source "index.html.erb" 
end


template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[#{pack}]",:delayed
end

service pack do
	action :start
end
