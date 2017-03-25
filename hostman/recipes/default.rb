#
# Cookbook:: hostman
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


search('node','role:appserver').each do |host|

	puts host['ipaddress']
	puts host['fqdn']
	log  "#{host['ipaddress']} ===>   #{host['fqdn']}" 

end

