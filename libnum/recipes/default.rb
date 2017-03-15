#
# Cookbook:: libnum
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
class ::Chef::Recipe
  include ::Sam
  end

(j,k)=add(3,4)

puts j
puts k 

(j,k)=sub(4,3)

puts j
puts k 

