#
# Cookbook:: lwrpe
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

lwrpe_file 'going to create a file' do
	filename "praveen"
	content "today"
	action :create
end

