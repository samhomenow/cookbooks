#
# Cookbook:: lavapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

a=['httpd','httpd-devel']
k=0
while ( k < a.length )
	
	pack=a[k]

	package  pack do
		action :install
		not_if "rpm -q #{pack}"
	end

	k+=1

end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb" 
end



service "httpd" do	
	action :restart
end
