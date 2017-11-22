#
# Cookbook:: demoapache
# Recipe:: default
#
#Testlink  Copyright:: 2017, The Authors, All Rights Reserved.

["httpd","httpd-devel"].each do |a|

   package a do
   	action :install
   end

end

file "/var/www/html/index.html" do
	content "this is first class"
end

service "httpd" do
	action :restart 
end

