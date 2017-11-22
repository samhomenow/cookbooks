#
# Cookbook:: excercise
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

##changing the time to singapore time zone

link "/usr/share/zoneinfo/Singapore" do
   to "/etc/localtime" 
   not_if "ls -l /etc/localtime | grep -i Singapore"
end

### Installing bash completion package

node['pack'].each do |a|

 package a do
	action :install
 end

end

### Entring hostname , from atttributes

template "/etc/hostname" do
	source "hostname.erb"
end


### Creating the user , using key from data bag

secret=Chef::EncryptedDataBagItem.load('singapore','city')



user "#{node['user']}" do
    comment "sample user"
    home "/home/#{node['user']}"
    shell '/bin/bash'
    supports manage_home: true
end

directory "/home/#{node['user']}/.ssh" do
    recursive true
    owner "#{node['user']}"
    group "#{node['user']}"
end

file "/home/#{node['user']}/.ssh/authorized_keys" do
        content "#{secret[node['user']]}"
        mode 0600
        owner "#{node['user']}"
	group "#{node['user']}"
end


