action :write do
	
	f=open("/tmp/#{new_resource.filename}","w")

	f.puts("#{new_resource.content}")

end


action :delete do
	File.delete("/tmp/#{new_resource.filename}")
end


action :remove do
	puts " I am removing the filleeeeeees"
end

