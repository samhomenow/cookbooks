#
# Cookbook:: 14folder
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

(1..40).each do |a|

	directory "/tmp/test/sam#{a}" do
		owner "root"
		group "root"
		mode 0755
		recursive true
	end

end
