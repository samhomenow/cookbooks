#
# Cookbook:: 26augfol
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['folder'].each do |foname,finame|

  puts foname
  puts finame['filename']

  unless File.exist?("/tmp/#{foname}/#{finame['filename']}")  


	directory "/tmp/#{foname}" do
		owner 'root'
		group 'root'
	end

	file "/tmp/#{foname}/#{finame['filename']}" do
		content "I am from folder #{foname}"
	end

 end


end
