#
# Cookbook:: hunfol
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

(0..100).each do |a|

	directory "/tmp/sam#{a}" do
		owner 'root'
		group'root'
	end

end

