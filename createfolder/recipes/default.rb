#
# Cookbook Name:: createfolder
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory "/tmp/sam" do
	owner 'root'
	group 'root'
	mode '0755'
end


(1..10000).each do |c|

	file "/tmp/sam/file#{c}" do
		content "I am file #{c}"
	end

end
