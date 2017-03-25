#
# Cookbook:: 10file
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

(1..node['total_number']).each do |a|

	directory "/tmp/sam#{a}" do
		owner 'root'
		group 'root'
		mode 0755
	end

end

