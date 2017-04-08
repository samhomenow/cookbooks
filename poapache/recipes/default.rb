#
# Cookbook:: poapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['platform'] 
	
	when /centos/i

	pack="httpd"

	when /ubuntu/i

	pack="apache2"

end

package pack do
	action :install
	not_if "rpm -qa | grep -i #{pack}"
end

file "/var/www/html/index.html" do
	content "
	Hi this is praveen
	this is first day"
end

service "httpd" do
	action :restart
end


