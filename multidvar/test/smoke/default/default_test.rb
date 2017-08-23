# # encoding: utf-8

# Inspec test for recipe multidvar::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

describe port(80) do
  it { should_not be_listening }
  skip 'This is an example test, replace with your own test.'
end


control "cis-1-5-1" do
  impact 1.0
    title "1.5.1 Set User/Group Owner on /etc/grub.conf (Scored)"
      desc "Set the owner and group of /etc/grub.conf to the root user."
        describe command('ls -ld /root/a') do
	    its('stdout') { should match /root\/a/ }
	      end
	      end
