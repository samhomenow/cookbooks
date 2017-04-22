#
# Cookbook:: folmulti
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['folder'].each do |foldername,filename|


	puts foldername
	puts filename['filea']
	puts filename['fileb']
end


