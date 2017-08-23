#
# Cookbook:: multidvar
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['folder'].each do |folder,fname|

	directory "/root/#{folder}" do
		owner 'root'
		group 'root'
	end
	


	file "/root/#{folder}/#{fname['filename']}" do
		content "
		I am from #{folder}

		filename #{fname['filename']}"
	end

end



