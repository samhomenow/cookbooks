
action :create do


	bash "untar" do
	     code <<-EOH
	     wget -O #{new_resource.localtar} #{new_resource.tarlink}
	     tar -zxvf #{new_resource.localtar} -C #{new_resource.certlocation}
	     EOH
	     not_if "test -f #{node['server']['sslcert']}"
	end

end
