#
# Cookbook:: ownres
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


ownres_filecr "adding some content" do
	filename "rajnish"
	content  "I have created lwrp"
	action :delete
end

