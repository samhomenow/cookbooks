#
# Cookbook Name:: hostentry
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

inst="install"
collect=search("node","tag*:today")

collect.each do |a|
	puts a['ipaddress']
	puts a['hostname']

	file a['hostname'] do
		content "hii"
		notifies :create,'service[inst]',:delayed
	end
	bash "install" do
		code <<-EOH
			echo "hii" > /tmp/sam
		EOH
		action :nothing
	end
end



