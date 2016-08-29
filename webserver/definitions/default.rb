define :foldercreate,:foldername=>"/tmp/sam"do
	directory params[:foldername] do
		owner 'apache'
		group 'apache'
		mode '0755'
	end
end
