#
# Cookbook Name:: multidir
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

%w[ sam kiran kranthi uttam naresh ].each do |a|

  directory a do
  	owner 'root'
	group 'root'
 end
end

if node['platform'] =~ /cent.*/

log 'hiii '

end
