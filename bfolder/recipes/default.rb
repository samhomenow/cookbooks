#
# Cookbook:: bfolder
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

directory "/tmp/balaji" do
	owner 'root'
	group 'root'
	mode 0755
end

cookbook_file "/tmp/balaji/office" do
	source "office"
end



