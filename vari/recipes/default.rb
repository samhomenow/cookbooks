#
# Cookbook Name:: vari
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


s=`ls`

ruby_block "running" do
	block do
			puts "hiiiiiiii  #{s}"
	end
end
	
