#
# Cookbook:: 13folder
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

(1..node['number']).each do |a|

	directory "/tmp/#{a}" do
		owner 'root'
	end
end


