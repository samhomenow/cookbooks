#
# Cookbook:: mufilefol
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['node227'].each do |folder,file|

	puts folder
	puts file[:file]
end
