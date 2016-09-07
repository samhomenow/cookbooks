#
# Cookbook Name:: goodmorning
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/root/goodmorning" do
	mode '0755'
end

file "/root/goodmorning/pavan" do
	content "Hi this file is generated using jenkins"
end

