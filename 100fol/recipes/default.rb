#
# Cookbook:: 100fol
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

(1..100).each do |a|

	directory "/tmp/sam#{a}" do
		owner 'root'
		group 'root'
	end

	file "/tmp/sam#{a}/file_#{a}" do
		content "
		I am from folder sam#{a}
		"
	end

end

