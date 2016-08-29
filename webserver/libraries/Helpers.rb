module Helpers

def directory_creation(directoryname)
	directory "#{directoryname}" do
	 owner 'apache'
	 group 'apache'
	 mode '0755'
	end
end

end

