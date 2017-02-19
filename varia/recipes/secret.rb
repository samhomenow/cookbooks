cookbook_file "/etc/chef/encrypted_data_bag_secret" do
	source "secretkey"
end
