
module Users

	def create(a,b)
		 group b do
		 action :create
		end

		user a do
		 home "/home/#{a}"
		 gid "#{b}"
		 shell "/bin/bash"
		 password '$1$redhat$9yxjZID8FYVlQzHGhasqW/'
		 action :create
		end
	end 

end
