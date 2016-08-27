#
# Cookbook Name:: nse-logrotate
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/logrotate.d/nse-rotate.conf" do
	source "logrotate.conf.erb"
end

