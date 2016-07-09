define :first_defin, :var => ' ' do
	bash "create" do 
		code <<-EOH
		echo `date` >> #{params[:var]}
		EOH
	end
end
