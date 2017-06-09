#
# Cookbook:: repos
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

cookbook_file "/tmp/nginx.key" do
	source "nginx.key"
	owner 'root'
	group 'root'
end

file "/etc/apt/source.list.d/nginx.repo" do
	content "
	deb http://nginx.org/packages/ubuntu/ trusty nginx
	deb-src http://nginx.org/packages/ubuntu/ trusty nginx
	"
end


apt_update 'update' do
  action :update
end

package "nginx" do
     version "1.8.0-1~utopic"
     options "--force-yes"
     action :install
end


