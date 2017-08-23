#
# Cookbook:: multiat14
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['folder'].each do |foname,finame|

  unless File.file?("/tmp/#{foname}/#{finame['filename']}")

	directory "/tmp/#{foname}" do
		owner 'root'
		group 'root'
	end


	file "/tmp/#{foname}/#{finame['filename']}" do
		content "
		I am from #{foname}
		#{finame['filename']}\n"

	end
  end

end


