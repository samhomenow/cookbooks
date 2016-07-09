#
# Cookbook Name:: nfs
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


package 'nfs-utils' do
	action :install
	not_if " rpm -qa | grep nfs-utils "
end

service "rpcbind" do
	action :start
end
	
def sam(mounts)
	mounts.each do |host,mnt|
		
		directory "#{mnt}" do
			user 'root'
			group 'root'
			mode '0755' 
		end

		mount "#{mnt}" do
			device "#{host}"
			fstype 'nfs'
			options 'ro,bg,_netdev,rsize=8192,actimeo=10,timeo=14,intr'
			action [:mount, :enable]
		end
		
		end
		
end

case node['server']['type']

#when /db|sam/	

#mounts={ '192.168.33.101:/WDPRO_TRIDION_QA' => "/WDPRO_TRIDION_QA" }

#sam mounts



	when /db1|sam1/	

	mounts={ '192.168.33.101:/WDPRO_TRIDION_QA'  => "/WDPRO_TRIDION_QA1" }

	sam mounts

	when /db2|sam2/	

	mounts={ '192.168.33.101:/WDPRO_TRIDION_QA' => "/WDPRO_TRIDION_QA" }

	sam mounts
end		



