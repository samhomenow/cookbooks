#
# Cookbook:: usermanagement
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

secret = Chef::EncryptedDataBagItem.load("us","dc")

user "#{secret['username']}" do
comment 'A random user'
 uid '1234'
        home '/home/random'
	  shell '/bin/bash'
	    password "#{secret['password']}"
	    end
