#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "/usr/local/src/apache-tomcat.tar.gz" do
	source "#{node['source']}"
	action :create 
	not_if "[[ -f /usr/local/src/apache-tomcat.tar.gz ]]"
end

bash "extraction " do
	code <<-EOH
	tar -zxvf /usr/local/src/apache-tomcat.tar.gz -C /usr/local
	folder=`tar -ztvf /usr/local/src/apache-tomcat.tar.gz | tail -1 | awk '{print $NF}' | perl -F"/" -ane 'print $F[0]'`
	mv /usr/local/${folder} /usr/local/tomcat
	echo 'export JAVA_HOME=/usr' >> ~/.bashrc
	echo 'export CATALINA_HOME=/usr/local/tomcat' >> ~/.bashrc
	echo 'export PATH=/usr/local/tomcat/bin:$PATH' >> ~/.bashrc
	EOH
	not_if "[[ -d /usr/local/tomcat ]]"
end


node['package'].each do |a|
	
	package "#{a}" do
		action :install
	not_if " rpm -qa | grep #{a}"
	end

end

bash "service start" do 
	code <<-EOH
	 bash /usr/local/tomcat/bin/startup.sh
	EOH
	not_if " ps aux | grep tomcat "
end
