module Helpers


def folder(usr,grps)


	directory "/home/#{usr}/.ssh" do
	action :create
	recursive true
	owner usr
	group grps
	end

end

end
