#
# Cookbook Name:: directory
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

folder_list=['a','b','c','d']

folder_list.each do |folder|
	directory "/tmp/#{folder}" do
		action :create
	end
end
