#
# Cookbook Name:: shellvar
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

s=`ls /tmp | grep -i sam`

execute "adding a file" do
	command "touch #{s}"
	notifies :run,"execute[dir]",:delayed
	not_if "[[ -e /#{s} ]]"
end

execute "dir" do
	command "mkdir /tmp/morning"
	action :nothing
end

log "#{s} is there"
