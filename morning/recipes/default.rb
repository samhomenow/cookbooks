#
# Cookbook Name:: morning
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory "/var/www/html/number" do
	owner 'root'
	group 'root'
	mode '0755'
end

(1..100).each do |a|
	
	bash "adding number" do
		code <<-EOH
		echo "#{a}" >> /var/www/html/number/index.html
		EOH
	not_if "grep #{a} /var/www/html/number/index.html"
	end
end
