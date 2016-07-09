#
# Cookbook Name:: inside
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.default['test']['test1']=`ls`

template "/tmp/test" do
	source "test.erb"
end

