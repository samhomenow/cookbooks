define :file_folder, :foldername=>nil do
	directory params[:foldername] do
		owner "apache"
		group "apache"
	end



end
