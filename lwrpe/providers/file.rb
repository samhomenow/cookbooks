action :create do
	ruby_block 'reload_client_config' do
	  block do
	  f=File.open"/tmp/#{new_resource.filename}"
	  f.write "hiiii"
	  end
	 end


end


action :delete do
	File.delete "/tmp/#{new_resource.filename}"

end



	



