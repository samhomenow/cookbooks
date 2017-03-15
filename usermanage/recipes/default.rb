#
# Cookbook:: usermanage
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

secret = Chef::EncryptedDataBagItem.load("india","chennai")

bash "adding user" do
	code <<-EOH
	useradd #{secret['username']}
	echo #{secret['password']} | passwd --stdin #{secret['username']}
	EOH
end

