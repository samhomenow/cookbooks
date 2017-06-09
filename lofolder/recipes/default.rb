#
# Cookbook:: lofolder
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['folder'].each do |foldername,fname|

 directory "/tmp/#{foldername}" do
 	owner 'root'
	group 'root'
 end



 file "/tmp/#{foldername}/#{fname['filename']}" do
 	content "
	#{foldername}
	#{fname}
	#{fname['filename']}
	"
end

end

