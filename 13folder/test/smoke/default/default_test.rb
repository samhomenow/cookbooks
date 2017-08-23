# # encoding: utf-8

# Inspec test for recipe 13folder::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

(1..10).each do |a|
	describe directory("/tmp/#{a}") do
	  it { should exist }
	end
end
