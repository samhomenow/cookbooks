#
# Cookbook Name:: aide
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

['aide','aide-common'].each do |pack|
	package pack do
		action :install
	end
end

template "/etc/aide/aide.conf" do
	source "aide.erb"
	notifies :run,"bash[updating-db]",:immediately
end

template "/usr/local/bin/aide.sh" do
	source "aide.sh.erb"
	owner 'root'
	group 'root'
	mode '0755'
	notifies :run,"execute[aide.sh]",:delayed
	not_if "[[ -d /usr/local/bin ]]"
end

bash "updating-db" do
	code <<-EOH
	aide -c /etc/aide/aide.conf --init
	cp -rf /var/lib/aide/aide.db.new /var/lib/aide/aide.db
	EOH
	action :nothing
end

cron "adding crontab" do
	weekday 0
	command 'bash /usr/local/bin/aide.sh'
end

execute "aide.sh" do
	command "bash /usr/local/bin/aide.sh"
	action :nothing
end
	
