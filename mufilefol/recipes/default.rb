#
# Cookbook:: mufilefol
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['values']=" I am from recipe"

log "volume from #{node['values']}"

include_recipe "mufilefol::sam"
