action :create do
	directory "/tmp/#{new_resource.foldername}" do
		owner 'root'
		group 'root'
	end

	files= `touch "/tmp/#{new_resource.foldername}/#{new_resource.filename}"`

	execute "echo hii > /tmp/#{new_resource.foldername}/#{new_resource.filename}"


end


