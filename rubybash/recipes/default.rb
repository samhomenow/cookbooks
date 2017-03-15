#
# Cookbook:: rubybash
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file=10


bash "creationg folder" do
	code <<-EOH
	mkdir /#{file}_test
	EOH
end
