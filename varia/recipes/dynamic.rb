file_count=`ls /etc/ | wc -l`

template "/tmp/sam" do
	source "sam.erb"
	variables(
	:file => file_count
	)
end
