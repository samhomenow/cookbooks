#
# Cookbook Name:: nse-aide
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'aide' do
	action :install
end

case node['platform']

	when "centos"

	 bash "Configuring Aide" do
	    code <<-EOH
		aide --init --config=/etc/aide.conf
		cp -rf /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
		EOH
	  end
	
          template "/etc/cron.daily/aide.sh" do
		source 'aide.sh.erb'
                user 'root'
		group 'root'
		mode '0755'
	  end


	
       when "ubuntu"

	 bash "configuring Aide" do
	   code <<-EOH
		aideinit
		mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
		mv /etc/cron.daily/aide /etc/cron.weekly/
		EOH
	end
	
          template "/etc/cron.daily/aide.sh" do
		source 'aide-ubuntu.sh.erb'
                user 'root'
		group 'root'
		mode '0755'
	  end
	
end
