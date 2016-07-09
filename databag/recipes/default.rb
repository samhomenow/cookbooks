#
# Cookbook Name:: databag
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/chef/encrypted_data_bag_secret" do
	source "secretkey.erb"
end

secret = Chef::EncryptedDataBagItem.load("bag","password")


bash "loading data" do
	code <<-EOH

	echo #{secret["name"]} >> /tmp/ragav
	echo #{secret["phone"]} >> /tmp/ragav
	EOH
end

