# Cookbook Name:: script
# # Recipe:: default
# #
# # Copyright 2016, YOUR_COMPANY_NAME
# #
# # All rights reserved - Do Not Redistribute
#



package "httpd"  do 
	action :install
	not_if "rpm -qa | grep httpd"
end


service "httpd" do 
	action :nothing
	
end
