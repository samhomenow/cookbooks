#
# Cookbook Name:: lwrp
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

lwrp_add "saaam" do
	num 7
	action :create
end

lwrp_add "i am subtracting" do
	num 7
	action :delete
end
