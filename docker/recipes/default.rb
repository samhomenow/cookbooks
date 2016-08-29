#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file '/tmp/sam.repo' do
  source 'http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
  action :create
end

rpm_package '/tmp/sam.repo' do
	action :install
end

docker_install do
	packs "docker"
end




