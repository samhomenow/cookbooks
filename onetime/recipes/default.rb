#
# Cookbook Name:: onetime
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "test" do
	code <<-EOH
	echo "hi" > /tmp/logs
	EOH
end

	node.override['name']['sam']=`cat /tmp/logs`

bash "sssm" do
	code <<-EOH 
	echo "#{node['name']['sam']}" /root/logs
	echo "#{node['sam']['home']}" > /root/logs
	EOH
end
