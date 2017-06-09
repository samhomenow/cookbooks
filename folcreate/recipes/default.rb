#
# Cookbook:: folcreate
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

%w[ sam sam2 sam3 ].each do |a|

	directory "/tmp/#{a}" do 
		owner 'root'
		group 'root'
		mode 0755
	end
end

