#
# Cookbook Name:: jenkin
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


bash "configuratio" do
        code <<-EOH
	wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
	rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
	EOH
end


node['pack'].each do |i|

	package "#{i}" do
		action :install
	end

end


service "jenkins" do 
	action :restart
end
