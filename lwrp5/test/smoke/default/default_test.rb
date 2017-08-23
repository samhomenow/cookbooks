# # encoding: utf-8

# Inspec test for recipe lwrp5::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end


describe file("/tmp/praveen/sam") do
	it { should exist }
end

