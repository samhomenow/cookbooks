#
# Cookbook:: file2
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['folder'].each do |foldername,filename|
	
	puts foldername
	puts filename['file1']
	puts filename['file2']


directory "/tmp/#{foldername}" do
	owner 'root'
	group 'root'
end



[filename['file1'],filename['file2']].each do |files|
	
	file "/tmp/#{foldername}/#{files}" do
		content "
		 I am from the folder #{foldername}"
	end
end



end
