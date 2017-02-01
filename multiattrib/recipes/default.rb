#
# Cookbook Name:: multiattrib
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node.default['server']['name']='value from recipe file'
node.default['server']['port']='8000'



log "#{node['server']['name']} ===> #{node['server']['port']}"
