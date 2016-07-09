#
# Cookbook Name:: variables
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
s=cookbook_name

bash "sam" do
	code <<-EOH
	echo #{s} > /tmp/logs
	EOH
end
