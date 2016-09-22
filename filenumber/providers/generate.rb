action :create do
	directory new_resource.dirname do
		owner 'root'
		group 'root'
		mode 0755
	end

(0..new_resource.nos).each do |nu|
		bash "Creating number #{nu}" do
			code <<-EOH
			echo #{nu} >> #{new_resource.dirname}/#{new_resource.filename}
			EOH
		end
end


end

action :delete do
	directory new_resource.dirname do
		action :delete
	end
end

