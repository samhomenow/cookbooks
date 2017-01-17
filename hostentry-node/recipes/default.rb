#
# Cookbook Name:: hostentry-node
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


pool=search("node","role:webserver")

pool.each do |a|

	bash "adding hostenry" do
		code <<-EOH
		echo "#{a['ipaddress']}   #{a['hostname']}" >> /etc/hosts
		EOH
		not_if "grep #{a['hostname']} /etc/hosts"
	end

end



