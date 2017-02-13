#
# Cookbook Name:: msearch
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

search('node','tag*:best') do |a|


    if a['hostname'] =~ /15|17/

    	puts a['hostname']
	puts a['ipaddress']
    end

end
