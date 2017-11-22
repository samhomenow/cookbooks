action :create do
	bash "create" do
		code <<-EOH
		echo #{new_resource.content} >> #{new_resource.filename}
		EOH
	end
end

