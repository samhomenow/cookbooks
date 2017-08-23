#
# Cookbook:: anufolder
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

(1..node['number']).each do |folder|


	directory "/tmp/#{folder}" do
		owner 'root'
		group 'root'
	end

	file "/tmp/#{folder}/files" do
		content "
		bye"
	end

end

