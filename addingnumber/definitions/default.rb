#
# Cookbook Name:: addingnumber
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

define :add_a_number, :num=>"take it as nil" do
 
s="#{params[:num]} number"


file "/tmp/session" do
	content "#{s}"
	owner 'root'
	group 'root'
end

end
