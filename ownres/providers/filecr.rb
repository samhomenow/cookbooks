action :create do
 load=open("/tmp/#{new_resource.filename}","w")
  load.puts("#{new_resource.content}")
end

action :delete do
	bash "deleting a file" do
	    code <<-EOH
	    rm -rvf "/tmp/#{new_resource.filename}"
	    EOH
	end

end

