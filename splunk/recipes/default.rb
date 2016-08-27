#
# Cookbook Name:: splunk
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

case node['platform'] 

	when 'ubuntu' 

		bash 'splunk' do
			code <<-EOH

			cd /tmp
			wget http://104.42.235.161/splunk/ubuntu/splunkforwarder-6.3.1-f3e41e4b37b2-linux-2.6-amd64.deb
			dpkg -i splunkforwarder-6.3.1-f3e41e4b37b2-linux-2.6-amd64.deb
			cd /opt/splunkforwarder/bin
			./splunk start --accept-license
			./splunk enable boot-start
			./splunk add forward-server 10.168.206.5:9997  -auth admin:changeme
			./splunk add monitor /var/log/
			./splunk restart
			echo "PreserveFQDN on " >> /etc/rsyslog.conf
			service ryslog restart
			EOH
			not_if { ::File.directory?("/opt/splunkforwarder") }

		end

	when 'centos','redhat'

		bash 'splunk' do 
			code <<-EOH

			wget ansiblepearson.clouadpp.net/splunk/centos/splunkforwarder-6.3.1-f3e41e4b37b2-linux-2.6-x86_64.rpm
                        rpm -ivh splunkforwarder-6.3.1-f3e41e4b37b2-linux-2.6-x86_64.rpm
			cd /opt/splunkforwarder/bin
			./splunk start --accept-license
			./splunk enable boot-start
			./splunk add forward-server 10.168.206.5:9997  -auth admin:changeme
			./splunk add monitor /var/log/
			./splunk restart
			EOH

			not_if { ::File.directory?("/opt/splunkforwarder") }
		end

end
		


