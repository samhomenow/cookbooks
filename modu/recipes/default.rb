#
# Cookbook Name:: modu
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

#class ::Chef::Recipe
#  include ::Sam
#end
Chef::Recipe.send(:include, Sam)

adde=add(1,2)

puts "#{adde}"
