#
# Cookbook:: folcount
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


list=`ls /etc |wc -l`

unless File.exist?("/var/run/cook")


["httpd","httpd-tools"].each do |a|

	package a do
		action :remove 
	end

	end
 

 s=open("/var/run/cook","w")
 s.puts("hi ")

end



["httpd","httpd-tools"].each do |a|

	package a do
		action :install 

		not_if "rpm -q #{a}"
	end

	end


template "/var/www/html/index.html" do
	source "index.html.erb"
 	variables(
	:total => list
	)
	notifies :restart,"service[httpd]",:delayed
end


service "httpd" do
	action :nothing
end








