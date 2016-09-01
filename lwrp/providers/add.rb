action :create do
	s=new_resource.num + 4
	puts s
end


action :delete do
	s=new_resource.num - 4
	puts s
end
