#
# Cookbook Name:: monapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

["httpd.x86_64","httpd-tools"].each do |pack|


package "#{pack}" do
	action :install
	not_if "rpm -qa | grep -i #{pack}"
end

end


file "/var/www/html/index.html" do
	content "
 	today is monday"
	end

service "httpd" do
	action :start 
end


