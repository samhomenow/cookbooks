#
# Cookbook Name:: search
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
# 

pool=search("node","role:#{node['server']}")


pool.each do |a|
	bash "hosts" do
		code <<-EOH
		echo "#{a[:ipaddress]}  #{a[:hostname]}" >> /etc/hosts
		EOH
		not_if "grep #{a[:hostname]} /etc/hosts"
	end
end
