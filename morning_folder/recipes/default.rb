#
# Cookbook:: morning_folder
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

directory "/tmp/today/fol1/fol2" do
	owner 'root'
	group 'root'
	mode 0755
	recursive true

end

cookbook_file "/tmp/today/fol1/count" do
	source "count"
	owner 'root'
	group 'root'
end

file "/tmp/today/sam" do
	content "
	this is sam
	from india"
	owner 'root'
	group 'root'
end
