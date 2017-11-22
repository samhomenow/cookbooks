#
# Cookbook:: timezone
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

['ntpdate-4.2.6p5-25.el7.centos.2.x86_64'].each do |a|
    
      package a do
      	action :install
      not_if "rpm -qa | grep #{a}"
      end
end


service 


node['platform']

bash "setting up time zone" do
	code <<-EOH
	service ntpd restart
	ln -s /usr/share/zoneinfo/US/Pacific /etc/localtime
	EOH
	
end


