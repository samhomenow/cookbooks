#
# Cookbook Name:: attrib
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

if node['hostname'] =~ /224/
	puts "hiii"

else
	puts "your are not 224"
end

