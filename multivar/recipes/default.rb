#
# Cookbook Name:: multivar
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


node['a']['b'].each do |first,second|
	puts "#{first} --> #{second['d']}"
end

a=1+3

template "/tmp/sam" do
	source "sam.erb"
	variables(
	:number => a
	)
	end


