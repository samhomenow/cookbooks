#
# Cookbook:: sunapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


case node['platform']

     when 'redhat','centos'
     		pack="httpd"

     when 'ubuntu'
     		pack="apache"
end

package "#{pack}" do
	action :install
	not_if "rpm -qa | grep -i #{pack}"
end



cookbook_file "/var/www/html/index.html" do
	source "apache_content"
	notifies :restart,"service[#{pack}]",:delayed
end


service "#{pack}" do
	action :nothing
end

log "End of the script@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
