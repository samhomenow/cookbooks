#
# Cookbook Name:: createdirectory
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory "/tmp/karthick" do
	owner "root"
	group "root"
	mode "0755"
end

file "/tmp/karthick/firstclass" do
	content "
	This is my first class"
end

file "/tmp/karthick/trinath" do
	content "
	This is trinath"
end

package "httpd" do
	action :install
end

