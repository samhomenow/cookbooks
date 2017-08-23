#
# Cookbook:: 15aug
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['port']=8090

date_from_system=`date`

case node['platform']

	when /cen.*/i,"redhat","fedaro"

		pack="httpd"
	
	when "debien","ubuntu"
		
		pack="apache2"

end


package pack do	
	action :install
	not_if "rpm -qa | grep #{pack}"
end



template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[#{pack}]",:delayed
end



template "/var/www/html/index.html" do
	source "index.html.erb"
	variables({
	:date => date_from_system
	})
end

service pack do
	action :start
end


