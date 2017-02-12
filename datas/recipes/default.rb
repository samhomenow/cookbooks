#
# Cookbook Name:: datas
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe "datas::key"

secret = Chef::EncryptedDataBagItem.load("kranthi","scm1")

a= secret['a'] + secret['b']

puts a
