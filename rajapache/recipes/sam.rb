#
# Cookbook:: rajapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['port']=9090

include_recipe 'rajapache1::default'
