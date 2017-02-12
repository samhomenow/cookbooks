#
# Cookbook Name:: memory
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

search("node","role:web").each do |a|
	puts a['automatic']['memory']['uptime']
	puts a['run_list']
end
