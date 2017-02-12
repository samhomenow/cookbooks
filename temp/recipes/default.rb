#
# Cookbook Name:: temp
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node['a']['b'].each do |first,second|

	template "/tmp/#{first}" do
		source "sam.erb"
		variables(
		:first => first,
		:second => second['var']
		)
	end

end
