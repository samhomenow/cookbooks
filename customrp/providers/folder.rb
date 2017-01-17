

action :create do
	log "creating folder"
	directory "#{new_resource.filename}" do
		owner 'root'
	end
end
