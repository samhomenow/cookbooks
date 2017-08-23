#
# Cookbook:: 10folsnow
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

(1..10).each do |a|
	directory "/tmp/#{a}" do	
		owner 'root'
		group 'root'
	end
end

