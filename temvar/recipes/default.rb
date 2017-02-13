#
# Cookbook Name:: temvar
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

a=` ls | wc -l`

ruby_block " nothing " do
	block do

	if a > 19
		a=15
	end

end
end


template "/tmp/sam" do
	source "sam.erb"
	variables(
	:avar => a
	)
end

