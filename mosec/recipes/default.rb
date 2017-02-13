#
# Cookbook Name:: mosec
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

template '/etc/chef/encrypted_data_bag_secret' do
	source 'secret.erb'
end

