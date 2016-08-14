#
# Cookbook Name:: sslcerts
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/etc/chef/encrypted_data_bag_secret" do
	source "secret.erb"
end
