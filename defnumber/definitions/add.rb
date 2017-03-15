define :add, :a=>'1',:b=>2 do
	y=params[:a]+params[:b]
	puts y
end
