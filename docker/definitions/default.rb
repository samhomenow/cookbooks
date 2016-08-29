
define :docker_install, :packs=>nil do
	package params[:packs] do
		action :install
	end
end
