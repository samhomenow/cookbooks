#
# Cookbook Name:: nfslibs
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

class ::Chef::Recipe
  include ::Helpers
end

package 'nfs-utils' do
	action :install
	not_if " rpm -qa | grep nfs-utils "
end

service "rpcbind" do
	action :start
end
	


case node['server']['type']

	when /db1|sam/	

        node['nfslibs']['mounts1'].each do |host,mounts|
	sam(host,mounts)
	end

	when /db2|sam2/	

	mounts=node['nfslibs']['mount2'].each do |host,mounts|

	sam(host,mounts)
	end		

end


puts "#{node[sam]}"
