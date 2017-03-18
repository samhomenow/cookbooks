#
# Cookbook Name:: multidir
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node['tcs']['cone'].each do |foldername,filenames|


directory "/tmp/#{foldername}" do
	owner 'root'
	group 'root'
	mode '0755'
end

file "/tmp/#{foldername}/#{filenames['filename']}" do
	content "
	This is #{filenames['filename']} $$$$ #{foldername}
	"
end


end
