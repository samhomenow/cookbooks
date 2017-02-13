#
# Cookbook Name:: varser
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

search("node","tag*:best").each do |a|
	
	puts a['hostname']
	puts a['ipaddress']
end

