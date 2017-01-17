#
# Cookbook Name:: secret-copy
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

cookbook_file "/etc/chef/encrypted_data_bag_secret" do
	source "secretkey"
	mode "0644"
end
