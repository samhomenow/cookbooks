#
# Cookbook Name:: nse-sslcerts
# Recipe:: default
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#

## This cookbook is to copy the ssl certificates to HA proxy vm's.
## Copy the .pem to /etc/ssl/certs/
# secrets = Chef::EncryptedDataBagItem.load("certificates", "wsssl")

# if secrets["wssslchk"]
#   ruby_block "write_key" do
#     block do
#       f = ::File.open("/etc/ssl/certs/world_wallstreetenglish_com_cert.pem", "w")
#       f.print(secrets["wssslchk"])
#       f.close
#     end
#     not_if do ::File.exists?("etc/ssl/certs/world_wallstreetenglish_com_cert.pem"); end
#   end
# end
directory '/AZVOL/certs' do
	mode '0755'
	user 'root'
	group 'root'
	recursive true
end

secrets = Chef::EncryptedDataBagItem.load("certificates", "certifs")

if secrets["certificate_pem"]
  ruby_block "write_key" do
    block do
      f = ::File.open(node['nodejs']['certificate_pem'], "w")
      f.print(secrets["certificate_pem"])
      f.close
    end
    not_if do ::File.exists?("#{node['nodejs']['certificate_pem']}"); end
  end
end

if secrets["certificate_key"]
  ruby_block "write_key" do
    block do
      f = ::File.open(node['nodejs']['certificate_key'], "w")
      f.print(secrets["certificate_key"])
      f.close
    end
    not_if do ::File.exists?("#{node['nodejs']['certificate_key']}"); end
  end
end