#
# Cookbook Name:: useradmin
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data=Chef::EncryptedDataBagItem.load('user','passwd')

class ::Chef::Recipe
include ::Helpers
end


node['group']['list'].each do |grps|


	group grps do
               	action :create
		not_if "getent group | grep #{grps}"
	end


	
	node["#{grps}"].each do |usr|
		 


		 user usr do
		 comment "#{usr} test"
		 home "/home/#{usr}"
		 gid     grps
		 shell '/bin/bash'
		 supports manage_home: true
		 end
		
		 folder(usr,grps)


	#Authorized keys
	
	
	key=data["#{usr}"]['id']
	
	ssh=data["#{usr}"]['key']

	if node['servertype']=~ /bastion/


		file "/home/#{usr}/.ssh/id_rsa" do
			content "#{ssh}"
			mode 0600
			owner usr
			group grps
		end

	end


	file "/home/#{usr}/.ssh/authorized_keys" do
		content "#{key}"
		mode 0600
		owner usr
		group grps
	end

	##Adding grps

	bash "adding sudo list" do
		code <<-EOH
		echo "%#{grps}    ALL=NOPASSWD: ALL, !/bin/su" > /etc/sudoers.d/#{usr}
		EOH
       	end

	
	end




end

