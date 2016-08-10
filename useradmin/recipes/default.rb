#
# Cookbook Name:: useradmin
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data=data_bag_item('user','passwd')

data.each do |a|
	bash "packs" do 
		code <<-EOH
		echo data['#{a}'] >> /tmp/lossss
		EOH
		end
end

puts data[a]

