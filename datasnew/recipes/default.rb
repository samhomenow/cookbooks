#
# Cookbook:: datasnew
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

secret = Chef::EncryptedDataBagItem.load("india","delhi")


puts secret['a']

puts secret ['b']

