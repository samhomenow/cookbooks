#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


mysql_home = "#{node['mysql']['homedir']}"
var_dir = "#{node['mysql']['homedir']}/mysql/var"
var_log = "#{node['mysql']['homedir']}/mysql/var/log"
mysql_user="#{node['mysql']['user']}"

##Creating mysql user
user mysql_user do
	shell '/bin/false'
	action :create
	not_if "grep #{node['mysql']['user']} /etc/passwd", :user => "#{node['mysql']['user']}"
end

#creating mysql home directory

directory mysql_home do
	owner mysql_user
	group mysql_user
	mode "0755"
	action :create
	recursive true
	not_if { File.exist?("#{node['mysql']['homedir']}") }
end

#Taking backup of already existing my.cnf with date , month and year format
###
execute "mv /etc/my.cnf /etc/my.cnf_`date +%d%m%y`" do
        only_if '[[ -e /etc/my.cnf ]]'
end

                

## Using remote_file , we are downloading the tar file through apache 

remote_file "/tmp/mysql.tar.gz" do
	#source 'http://10.72.6.182/tars/mysql-5.6.23-linux-glibc2.5-x86_64.tar.gz'
	source 'ftp://192.168.33.10/pub/mysql-5.6.23-linux-glibc2.5-x86_64.tar.gz'
	path "/tmp/mysql.tar.gz"
	not_if { ::File.exist?("/tmp/mysql.tar.gz") }
end

## Un-tarring downloaded package and renaming it as mysql 

execute "Downloading source" do
	command <<-EOH
	echo "slave" > /tmp/slave
	tar -zxvf /tmp/mysql.tar.gz -C #{node[:mysql][:homedir]}/ 
	mv -f   #{node[:mysql][:homedir]}/mysql-5.6.23* #{node[:mysql][:homedir]}/mysql
	cp -rf  #{node[:mysql][:homedir]}/mysql  /usr/local/
	EOH
	not_if { ::File.exist?("/usr/local/mysql/bin/mysql")}  
end

##creating /AZVOL/mysql/var/log folder

directory var_log do
	owner mysql_user
	group mysql_user
	mode "0755"
	action :create
	recursive true
	not_if { ::File.exist?("#{node['mysql']['homedir']}/mysql/var/log") }  
end


##Installing libaio and perl-Data-Dumper ( mysql_install_db script need the following package during installation )

package ['libaio', 'perl-Data-Dumper'] do
	action :install
end 

#Creating mysqld init services file
#
execute "Changing permission" do
	command <<-EOH
	chown -R mysql:mysql #{node[:mysql][:homedir]}/mysql
	cp -rf #{node[:mysql][:basedir]}/support-files/mysql.server /etc/init.d/mysqld
	EOH
end

##Copying all the binarys in /MSVOL/mysql/bin to /usr/local/bin /bin /usr/bin locations

bash "Copying_file" do
	code <<-EOH
	for i in "#{node['mysql']['basedir']}/bin/*"
	do	
		bas="`basename $i`"
		cp -rvf $i /usr/local/bin && chmod 755 /usr/local/bin/$bas && chown mysql:mysql /usr/local/bin/$bas
		cp -rvf $i /usr/bin && chmod 755 /usr/bin/$bas && chown mysql:mysql /usr/bin/$bas
		cp -rvf $i  /bin && chmod 755 /bin/$bas && chown mysql:mysql /bin/$bas
	done
	EOH
	
       not_if { ::File.exist?("/usr/local/bin/mysql")}
end

##Creating my.cnf file from template

template "/etc/my.cnf" do
	source "slave.cnf.erb"
	action :create
	notifies :restart, 'service[mysqld]', :delayed
        not_if { ::File.exist?("/tmp/slave")}
end

##Installing mysql , using mysql_install_db script

execute "Installing mysql" do
	command <<-EOH
	cd  #{node[:mysql][:basedir]}/
	scripts/mysql_install_db --user=#{node['mysql']['user']}
	 echo "Installation completed" > /tmp/mysql_install
        EOH
        not_if do File.exists?('/tmp/mysql_install') end
end


service "mysqld" do
	action :start
end

#Creating link for socket. ( Mysql failed to start without /tmp/mysql.sock file . So we are creating the link )

execute "#{node[:mysql][:basedir]}/tmp/mysql.sock" do
	command <<-EOH
	cd  /tmp
	ln -s #{node[:mysql][:basedir]}/tmp/mysql.sock .
	EOH
	notifies :restart, 'service[mysqld]', :immediately
	not_if do File.exists?('/tmp/mysql.sock') end
end

service "mysqld" do
	action :nothing
end

##Setting mysql user password

bash "Creating user" do
	code <<-EOH
	#{node['mysql']['basedir']}/bin/mysqladmin -u #{node['mysql']['root-user']} password '#{node['mysql']['root-pass']}'
	echo "user created" > /tmp/mysql
	EOH
	not_if do File.exists?('/tmp/mysql') end
end

