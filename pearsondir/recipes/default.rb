#
# Cookbook:: pearsondir
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['pearson'].each do |folname,filename|

	directory "/tmp/#{folname}" do
		owner 'root'
		group 'root'
	end


	file "/tmp/#{folname}/#{filename['file']}" do
		content "
		I am from folder => #{folname}
		filename  #{filename['file']}
		"
	end

end

