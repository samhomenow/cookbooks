#
# Cookbook Name:: ragav
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


bash "ragav" do
	code <<-EOH
	cd /root
	mkdir basent
	cd basent
	for i in $(seq 100)
	do
	touch sam${i}
	done
	EOH
	not_if  "ls -l /root/basent"
end

