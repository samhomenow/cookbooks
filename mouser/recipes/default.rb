#
# Cookbook Name:: mouser
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

secret = Chef::EncryptedDataBagItem.load("manoj","adp")

bash "usercreateion" do
	code <<-EOH
	useradd #{secret['user']}
	echo "#{secret['password']}" | passwd --stdin #{secret['user']}
	EOH
	not_if "grep #{secret['user']} /etc/passwd"
end

