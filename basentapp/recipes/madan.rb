class ::Chef::Recipe
  include ::Helpers
  end

directory "/var/www/html/madan" do

	owner "apache"
	group "apache"
	mode "0755"
end

cookbook_file "/var/www/html/madan/index.html" do
	source "madan.erb"
	owner "apache"
	group "apache"
	mode "0755"
end

fol_file("/var/www/html/chennai","/var/www/html/chennai/index.html","I_am_inside_chennai")

file_folder do
   foldername "/var/www/html/sams"
end

service "httpd" do
	action :restart
end
