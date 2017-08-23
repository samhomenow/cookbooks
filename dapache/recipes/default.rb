#
# Cookbook:: dapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i httpd"
end

file "/var/www/html/index.html" do
	content "
	This is praveen"
end


service "httpd" do
	action :start
end



