#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


file "/etc/yum.repos.d/mongodb-org-3.0.repo" do
	content "
[mongodb-org-3.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.0/x86_64/
gpgcheck=0
enabled=1
	"
end

%w( mongodb-org mongodb-org-server mongodb-org-shell mongodb-org-mongos mongodb-org-tools ).each do |pack|

  package pack do
  	action :install
        not_if "rpm -qa  | grep #{pack}"
  end
 
end
