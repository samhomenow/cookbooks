#
# Cookbook:: anuapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['platform']

	when "redhat",/cent.*/i,"fedaro"
		pack="httpd"

	when "ubuntu" 
		pack="apache2"

end


package pack do
	action :install
	not_if "rpm -qa | grep #{pack}"
end


cookbook_file "/var/www/html/index.html" do
	source "index.html"
end

service pack do
	action :start
end





