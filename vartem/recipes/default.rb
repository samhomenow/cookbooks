#
# Cookbook:: vartem
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


var1=`ls /etc | wc -l`

template "/tmp/sam" do
	source "sam.erb"
	variables(
	:var => var1
	)
end
