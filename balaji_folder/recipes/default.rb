#
# Cookbook Name:: balaji_folder
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/tmp/sam" do
	owner 'root'
	group 'root'
	action :create
end


cookbook_file "/tmp/sam/kumar" do
	source "file_content"
	owner 'root'
	group 'root'
end





