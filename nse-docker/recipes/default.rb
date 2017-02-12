#
# Cookbook Name:: nse-docker
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/mnt/nse.conf" do
	source "nse.conf"
	user 'root'
	group 'root'
	mode '0755'
end

execute "docker pull" do
	command 'docker pull praveensams/node'
	command 'docker pull praveensams/nginx'
end

execute "nodejs installation" do
	command 'docker run  -v /AZVOL:/AZVOL --name "nodejs" -t -d praveensams/node bash'
	command 'docker exec -d nodejs pm2 start server.js'
end

execute 'nginx predefined task' do
	command " cat /mnt/nse.conf  | sed  's/proxy_pass http:\/\/.*:8080;/proxy_pass http:\/\/nodejs:4001;/g' | tee  /opt/default.conf"

end

execute "Nginx installation" do
	command 'docker run  --name "nginx" --link nodejs:nodejs -p 80:80 -t -d praveensams/nginx bash'
	command 'docker cp /opt/default.conf nginx:/etc/nginx/conf.d'
	command ' docker exec -d nginx service nginx restart'
end

#bash "docker installation" do
#	code <<-EOH
#	docker pull praveensams/node && docker pull praveensams/nginx
#	docker run  -v /AZVOL:/AZVOL --name "nodejs" -t -d praveensams/node bash
#	sleep 2
#	docker exec -d nodejs pm2 start server.js
#	sleep 2
#	cat /mnt/nse.conf  | sed  's/proxy_pass http:\/\/.*:8080;/proxy_pass http:\/\/nodejs:4001;/g' | tee  /opt/default.conf
#	sleep 2
#	docker run  --name "nginx" --link nodejs:nodejs -p 80:80 -t -d praveensams/nginx bash
#	sleep 2
#	docker cp /opt/default.conf nginx:/etc/nginx/conf.d
#	sleep 3
#	docker exec -d nginx service nginx restart
#	sleep 3
#	mkdir -p /AZVOL/{mongodb2/logs,mongodb/log}
#	EOH
#end







