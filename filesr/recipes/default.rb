#
# Cookbook Name:: filesr
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file "/tmp/sam" do
	source "sam"
	force_unlink true
end
