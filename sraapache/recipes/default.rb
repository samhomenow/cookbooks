#
# Cookbook:: sraapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.



case node['platform'] 

	when 'redhat','fedora','centos'
		pack="httpd"
	when 'ubuntu'
		pack="apache"
end



package "installing apache" do
	package_name "#{pack}"
	action :install
end


cookbook_file "/var/www/html/index.html" do
	source "index.html"
end


service "#{pack}" do	
	service_name pack
	action :restart
end

