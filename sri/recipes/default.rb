#
# Cookbook Name:: sri
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.



secret = Chef::EncryptedDataBagItem.load("aathi","home")


log "my phone is #{secret['number']}"

log " myname is #{node['myname']}"

log "my place #{node['place']}"
