#
# Cookbook Name:: nfs
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


case node['server']['type']

	when /db/	

	mounts={ '192.168.33.101:/WDPRO_TRIDION_QA' => "/WDPRO_TRIDION_QA" }

	mounts.each do |host,mnt|

		mount "#{mnt}" do
			device "#{host}"
			fstype 'nfs'
			options 'ro,bg,_netdev,rsize=8192,actimeo=10,timeo=14,intr'
			action [:mount, :enable]
		end
		
		end
end		



