#
# Cookbook:: varia
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

directory node['folder']['a'] do
	owner 'root'
	group 'root'
	mode 0755
end

node['folder']['list'].each do |folder,file|

	directory "/#{folder}" do
		owner 'root'
		group 'root'
		mode '0755'
	end


	file "/#{folder}/#{file['filename']}" do
		content "
			folder #{folder}
			file   #{file['filename']}
			"
		end

end

