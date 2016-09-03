#
# Cookbook Name:: ramkumar
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "nginx" do
	action :install
end

service "nginx" do
	action :restart
end
