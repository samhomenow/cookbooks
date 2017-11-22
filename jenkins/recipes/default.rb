#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

remote_file '/etc/yum.repos.d/jenkins.repo' do
	source 'http://pkg.jenkins.io/redhat-stable/jenkins.repo'
	owner 'root'
	group 'root'
	not_if 'test -f /etc/yum.repos.d/jenkins.repo'
end

execute 'importing key' do
	command 'rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key' 
end

['jenkins','java-1.7.0-openjdk'].each do |a|

	package a do
		action :install
		not_if 'rpm -qa | grep #{a}'
	end
end


service "jenkins" do
	action :restart
end
	


