#
# Cookbook:: apache_balaji
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "apache2" do
	action :install
end


cookbook_file "/var/www/html/index.html" do
	source "index.html"
end


service "apache2" do	
	action :restart
end


