
define :filecont, :filename=>'/tmp/files' do

	file "#{params[:filename]}" do
		content "
		created by difinitions
		"
	end
end


