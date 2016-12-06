#
# Cookbook Name:: secret
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


ruby_block "running" do

block do

object = Chef::EncryptedDataBagItem.load("home","praveen1")

puts object['dbuser']

end

action:run

end
