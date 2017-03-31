#
# Cookbook:: userinfo
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

secret = Chef::EncryptedDataBagItem.load("america","seattle")

puts secret["name"]

include_recipe "userinfo::sam"

puts secret["add"]
