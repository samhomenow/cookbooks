#
# Cookbook:: lwrpnum
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

lwrpnum_add "adding number" do
	a 30
	b 20
	action :add
end


lwrpnum_add "substractinf number" do
	a 30
	b 20
	action :delete
end
