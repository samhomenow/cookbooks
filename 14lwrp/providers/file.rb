action :create do
        f=File.new("/tmp/#{new_resource.filename}","w")
	f.puts "#{new_resource.content}"
end


action :delete do
	File.remove "/tmp/#{new_resource.filename}"

end



	



