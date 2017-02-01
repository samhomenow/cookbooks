#
# Cookbook Name:: tendir
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

case node['platform'] 

 when /Cent.*/i
     pack='httpd'

 when /ubuntu/i
     pack='apache'

end

if ! "rpm -qa | grep pack"

package pack do
	action :install
end

end

file "/tmp/sam"  do
	content "
	Hi this is sam
	"
	not_if "grep sam /tmp/sam"
end

template "/tmp/sam1" do
	source "sam.erb"
end
