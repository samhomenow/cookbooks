#
# Cookbook Name:: ipcollect
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

#
#search("node","role:web").each do |a|
#
#	bash "adding ip" do
#		code <<-EOH
#		echo "#{a['ipaddress']}   #{a['hostname']}" >> /etc/hosts
#		EOH
#	        not_if "grep #{a['hostname']} /etc/hosts"
#	end
#end
# 
s=search("node","role:web")

log "hoooo #{s}"
log "hoooo #{s.size}"

j=0

while j < (s.size-1) 

	puts s[j]['ipaddress']
	puts s[j]['hostname']
	log "#{s[j]}"

	j=j+1
end

	
