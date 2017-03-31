#
# Cookbook:: apachesri
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node['platform'] =~ /centos|redhat/

package "httpd" do
	action :install
end

end

file "/var/www/html/index.html" do
	content "
	Hi this is from chef
	I have added one more line"

end


service "httpd" do 
	action :restart
end

