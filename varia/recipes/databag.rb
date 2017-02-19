secret = Chef::EncryptedDataBagItem.load("morning","class")

puts secret['timing']
puts secret['place']
