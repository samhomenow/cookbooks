#
# Cookbook:: ravi
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

p=['httpd','httpd-devel']
i=0

while ( i < p.length )
   
   pack=p[i]

   package pack do
      action :install
   not_if "rpm -q #{pack}"
   end
  i+=1 
end

file "/var/www/html/index.html" do
   content "this is chef class one"
   notifies :restart,'service[httpd]',:immediately 
end

service "httpd" do
   action :nothing
end




