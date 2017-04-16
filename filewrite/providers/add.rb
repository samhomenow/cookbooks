
action :write do
	
	f=open("/tmp/#{new_resource.filename}","w")

	f.puts("#{new_resource.content}")

end


action :remove do
	File.delete('/tmp/#{new_resource.filename}')
end



