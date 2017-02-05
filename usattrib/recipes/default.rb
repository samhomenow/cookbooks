#
# Cookbook Name:: usattrib
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node.default['session']='second_from_recipe_file'

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i httpd"
end


template "/var/www/html/index.html" do
	source "index.html.erb"
	notifies :restart,'service[httpd]',:delayed
end

node['session1'].each do |foldername,filename|

	directory  "/var/www/html/#{foldername}" do
		end
	
	file "/var/www/html/#{foldername}/#{filename[:name]}" do
		content "filename #{filename}"
		end
end



service "httpd" do 
	action [:enable,:start]
end
