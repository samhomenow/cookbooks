#
# Cookbook Name:: secret
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template "/etc/chef/encrypted_data_bag_secret" do
	source "secret.erb"
end
