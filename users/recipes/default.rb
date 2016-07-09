#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

#class ::Chef::Recipe
 # include ::Helpers
#end

::Chef::Recipe.send(:include, Users)


node['user']['list'].each do |a,b|
	create(a,b)
end
