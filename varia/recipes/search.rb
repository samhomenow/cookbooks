
search("node","role:web").each do |node|

	bash "adding ip" do
	 code <<-EOH

	echo "Ipaddress: #{node['ipaddress']} => NodeName: #{node['hostname']}" >> /tmp/nodelist
	EOH
	end

end

	
	
