
action :add do
	y = new_resource.a + new_resource.b
	puts "#{y}\n"
end



action :mult do
	y = new_resource.a * new_resource.b
	puts y
end
