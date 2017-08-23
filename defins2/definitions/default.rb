define :add, :a => '' , :b => ' ' do

	y = params[:a] + params[:b]

	puts y

end


define :packs, :a => '' do
  
	case params[:a]

	when "update"

		if ( node['platform'] =~ /cent.*/i )
			`yum install httpd -y`
			puts "centos"
		end
		if ( node['platform'] =~ /ubuntu/i )
			`apt-get install httpd -y`
			puts "ubuntu"
		end
	else
		puts "invalid input"
	end

end


