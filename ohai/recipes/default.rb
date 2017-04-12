#
# Cookbook:: ohai
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

f=open("/tmp/sam","w")

search("node","role:webserver").each do |node|

	f.puts "#{node['hostname']}  #{node['ipaddress']}"
end

