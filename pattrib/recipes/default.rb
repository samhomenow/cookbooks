#
# Cookbook Name:: pattrib
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

template "/tmp/session" do
	source "class.erb"
end
