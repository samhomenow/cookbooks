#
# Cookbook Name:: nse-hardening
# Recipe:: default
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#
#


############### Taking configuration file Backup #####################################################


execute "Backup" do
	command <<-EOH
	cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config`date +%d%m%y`
	cp -rf /etc/ssh/ssh_config /etc/ssh/ssh_config`date +%d%m%y`
	cp -rf /etc/sudoers /etc/sudoers`date +%d%m%y`
	EOH
	not_if '[  -f /etc/ssh/sshd_config`date +%d%m%y` -a  -f /etc/ssh/ssh_config`date +%d%m%y` -a -f  /etc/sudoers`date +%d%m%y` ]'
end



bash "ssh config" do
	code <<-EOH
	 perl -ne 'if(/#.*Protocol.*/) {print "Protocol 2\n"} elsif (/.*Protocol.*/) {print "Protocol 2\n"} elsif ((/^#PermitRootLogin.*/)||(/^PermitRootLogin without-password/)) { print "PermitRootLogin no\n"}  elsif(/ClientAliveInterval.*/) {print  "ClientAliveInterval 300\n" } else {print } END { print "\nTCPKeepAlive yes\nClientAliveCountMax 99999\nBanner /etc/banners\nClientAliveInterval 300\n"}' /etc/ssh/sshd_config > /tmp/sshd_config
	 cp -rf /tmp/sshd_config /etc/ssh/sshd_config
	 EOH
	 not_if " grep '^Banner' /etc/ssh/sshd_config "
end

#################### Yum Remove unwanted package | installing madatory packages #########################################################

case node['platform']

 when "ubuntu"

	 node['yum']['remove_package'].each do |pack|
		package pack do
			action :remove
		only_if "dpkg -l | grep -w ^#{pack}"
		end
	 end

	 node['yum']['install_package'].each do |pack|
		apt_package pack do
			action :install
		#only_if "apt-cache search ^#{pack}"
		not_if "dpkg -l | grep -w ^#{pack}"
		end
	 end

 when "centos"


	 node['yum']['remove_package'].each do |pack|
		package pack do
			action :remove
		only_if "rpm -qa | grep -w ^#{pack}"
		end
	 end

	 node['yum']['install_package'].each do |pack|
		package pack do
			action :install
		only_if "yum list all | grep -w ^#{pack}"
		end
 end

end
###################  Unwanted services ###############################################################

node['services']['unwanted'].each do |service|
	execute 'services' do
		command "chkconfig #{service} off"
	only_if "chkconfig --list | grep #{service}"
	end
end

#################### Sudoers file ###################################################################

template "/etc/sudoers" do
source "sudoers.erb"
	action :create
	only_if "#{node['server']['sudo_enable']} =~ /[a-z]+/"
end

################## Creating Disk Partition ##############################################################################

if node['server']['type'] =~ /db/

bash "Disk partition" do
	puts "Dba disk creation"
	code <<-EOH
	( echo -e "o\nn\np\n1\n\n\nw" )  | fdisk  #{node['disk']['device']}
	mkfs -j #{node['disk']['partition']} 
	mkdir -p #{node['disk']['label']}
	mount #{node['disk']['partition']} #{node['disk']['label']}
	if [[ ! `grep #{node['disk']['partition']} /etc/fstab` ]] && [[ `fdisk -l | grep #{node['disk']['partition']}` ]]
	then
	echo -e "\/#{node['disk']['partition']}\t\t#{node['disk']['label']}\t\t\text4\t\tdefaults,noatime  \t0 0" >> /etc/fstab
	fi
EOH
	not_if "fdisk -l | grep #{node['disk']['partition']}"
end



else

bash "Disk partition" do
	code <<-EOH
	( echo -e "o\nn\np\n1\n\n\nw" )  | fdisk  #{node['disk']['device']}
	mkfs -j #{node['disk']['partition']} 
	mkdir -p #{node['disk']['label']}
	mount #{node['disk']['partition']} #{node['disk']['label']}
	if [[ ! `grep #{node['disk']['partition']} /etc/fstab` ]] && [[ `fdisk -l | grep #{node['disk']['partition']}` ]]
	then
         echo -e "\/#{node['disk']['partition']}\t\t#{node['disk']['label']}\t\t\text4\t\tdefaults\t0 0" >> /etc/fstab
	fi
	EOH
	not_if "fdisk -l | grep #{node['disk']['partition']}"
end


end

###################################Mounting ###############################################################


###################################Adding History time stamp ##############################################

bash "Adding History time stamp" do
	code <<-EOH
	[[ -e /etc/bashrc ]] && BAS=/etc/bashrc
        [[ -e /etc/bash.bashrc ]] && BAS=/etc/bash.bashrc
	echo 'HISTTIMEFORMAT="%d/%m/%y %T  "' >> ${BAS}
	EOH
end



################## Banners ###############################################################################	

banners="#{node['ssh']['banners']}"


template '/etc/banners' do
	source "banners.erb"
	action :create
	not_if "cat /etc/banners | grep -i pearson"
end 



###################### Swap Creation ######################################

bash "swap creation" do
	code <<-EOH
	total_mem="`free -mt | perl -ne 'if(/(Mem:)(\s+)([0-9]+)(.*)/) {print $3)}'`"
        if [[ ${total_mem} -le 10 ]]
	then
		s="`free -mt | perl -ne 'if(/(Mem:)(\s+)([0-9]+)(.*)/) {print int($3*1.5)}'`"
		dd if=/dev/zero of=/usr/local/swap bs=1M count=$s
		mkswap /usr/local/swap
		swapon  /usr/local/swap
	fi
	EOH
	not_if "[ -f /usr/local/swap ]"
end

