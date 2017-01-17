#
# Cookbook Name:: athi
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

log "I am creating a file"

file "/tmp/testing" do
	content " 
	 server name : #{node['servername']}
	 "
	 owner 'root'
	 group 'root'
end

