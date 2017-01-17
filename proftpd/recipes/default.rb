#
# Cookbook Name:: proftpd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

["proftpd","TCL","expect"].each do |pack|

	package "#{pack}" do
		action :install
		not_if "rpm -qa | grep -i #{pack}"
	end
end



execute 'modifiying proftpd' do
	command 'echo PROFTPD_OPTIONS="-DSFTP" >> /etc/sysconfig/proftpd' 
	not_if "grep DSFTP /etc/sysconfig/proftpd"
end


group "proftpd" do
	action :create
	gid '1300'
end

user "proftpd" do
	uid '1400'
	gid '1300'
	home '/opt/proftpd proftpd'
	shell '/sbin/nologin'
end


["/sftp/home","/var/log/proftpd/logs","/opt/proftpd/etc","/opt/proftpd/bin"].each do |a|

	directory a do
		owner 1400
		group 1300
		recursive true
	end
end


["sftpCreateUser.sh","sftpChangePassword.sh"].each do |a|
	
	template "/opt/proftpd/bin/#{a}" do
		source "#{a}.erb"
		owner 1400
		group 1300
	end
end




bash "touching empty file" do
	code <<-EOH
	touch /opt/proftpd/etc/#{node['prefix']}_accounts.txt /opt/proftpd/etc/sftpd.group /opt/proftpd/etc/sftpd.passwd	
	chmod 440 /opt/proftpd/etc/sftpd.{group,passwd}
	chown -R proftpd:proftpd /sftp/home
	chmod -R 755 /sftp/home
	EOH
end


mount "mounting file system" do
	device "<%= node['nfsserver'] %>:<%= node['nfsshare'] %>"
	fstype 'nfs'
	options 'ro,_netdev,rsize=8192,actimeo=10,timeo=14,intr'
	action :enable
end

file "/root/.smbcred_#{node['credname']}" do
	content "
	username='smbuser'
	password='$1$ktByK0kN$1rKTYTUCJPHMxTRs/6w9r/'
	"
end

service "proftpd" do
	action :restart
end


