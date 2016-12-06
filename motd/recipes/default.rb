#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template "/etc/motd"  do
	source "motd.erb"
end

a=10

log "number #{a}"
