#
# Cookbook Name:: newrelic
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

catalinahome=`echo ${CATALINA_HOME}/newrelic`
catalinahome_yml=`echo ${CATALINA_HOME}/newrelic/newrelic.yml`

bash "Download and extract" do
	code <<-EOH
	cd $CATALINA_HOME
	wget -c  #{node['repo']['servername']}/tars/newrelic-java-3.19.2.zip 
	unzip newrelic-java-3.19.2.zip
        cd newrelic
	cp -rf  newrelic.yml newrelic.yml_org	
	EOH
end

template catalinahome_yml.chomp do
	source "newrelic.yml.erb"
end

bash "Package installation" do
	code <<-EOH
	java -jar newrelic.jar install
	/etc/init.d/tomcat restart 
	EOH
end


	

