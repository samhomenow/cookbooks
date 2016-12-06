#
# Cookbook Name:: searchnode
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

search("node","tags:dev*").each do |server|

	puts "#{server['ipaddress']} #{server['hostname']}"

end
