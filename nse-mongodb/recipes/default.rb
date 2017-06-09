#
# Cookbook:: nse-mongodb
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

bash "adding key" do
	code <<-EOH
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927	
	echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
	sleep 3
	apt-get update
	EOH
	not_if "test -e /etc/apt/sources.list.d/mongodb-org-3.2.list"
end

%w[ mongodb-org mongodb-org-server mongodb-org-mongos ].each do |packs|

    
apt_package packs do
	version '3.2.8'
	action :install
	not_if "dpkg -l | grep #{packs}"
end
end

%w[ DATA LOGS ].each do |folder|
	directory "/#{folder}/mongodb" do
		owner 'mongodb'
		group 'mongodb'
		mode 0755
		recursive true
	end
end


%w[ data logs scripts ].each do |folder|
	directory "/BACKUPS/mongodb/#{folder}" do
		owner 'mongodb'
		group 'mongodb'
		mode 0755
		recursive true
	end
end


template "/etc/mongod.conf" do
	source 'mongo.db.erb'
end

service "mongod" do
	action :restart
end


cookbook_file "/DATA/mongodb/keyfile" do
	source "keyfile"
end








