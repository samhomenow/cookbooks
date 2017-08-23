#
# Cookbook:: lwrp5
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

lwrp5_filec "adding a content" do
	foldername 'praveen'
	filename  'sam'
	content 'morning session'
	action :create
end



