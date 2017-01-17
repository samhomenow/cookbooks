#
# Cookbook Name:: secret
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.



object = Chef::EncryptedDataBagItem.load("sri","home")

include_recipe "secret::first"

puts object['a']

