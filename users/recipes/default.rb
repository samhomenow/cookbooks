#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

names=data_bag_item(:user,"passwd")

node['group']["#{node['user_group']}"].each do |a|
		puts names["#{a}"]
end
