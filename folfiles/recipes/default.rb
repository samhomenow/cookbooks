#
# Cookbook:: folfiles
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

s=['a','b','c','d','e','f','g','h','i','k']

s.each do |count|

 directory "/tmp/#{count}" do
 end

 file   "/tmp/#{count}/#{count}_file" do
    
      content "

      I am creating folder #{count}
      and file #{count}_file
      "
 end

 end
