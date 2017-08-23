#
# Cookbook:: aug-apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


case node['platform'] 
	
	when /cent.*/i,"redhat"
		pack="httpd"

	when "ubuntu","debien"
		pack="apache2"
	
end

package pack do
	action :install
end

file "/var/www/html/index.html" do
	content "
	Today is tuesday"
end

service pack do
	action :restart
end


