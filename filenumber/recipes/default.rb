#
# Cookbook Name:: filenumber
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

filenumber_generate "creating a file" do
	dirname '/tmp/newfolder'
	filename 'tempfile'
	nos 100
	action :create
end

