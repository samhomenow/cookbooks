#
# Cookbook:: nodesearch
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

search("node","name:node22*").each do |server|

	bash "adding filename" do
		code <<-EOH
		echo #{server['hostname']} #{server["ipaddress"]} >> /tmp/files
		EOH
		not_if "grep #{server['hostname']} /tmp/files"
	end

end
	
