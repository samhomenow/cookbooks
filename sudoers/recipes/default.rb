#
# Cookbook Name:: sudoers
# Recipe:: default
#
# Copyright 2016, Pearson
#
# All rights reserved - Do Not Redistribute
#

node['groups'].each do |grps|

	bash "runs" do 
		code <<-EOH
		echo "%#{grps}    ALL=NOPASSWD: ALL" > /tmp/sam
		EOH
	end

end
