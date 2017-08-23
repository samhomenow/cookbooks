#
# Cookbook:: adata
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


secret = Chef::EncryptedDataBagItem.load("home","user")


puts secret['user']
