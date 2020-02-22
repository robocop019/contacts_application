require 'http'

system 'clear'

response = HTTP.get('http://localhost:3000/api/first_contact_url')
contact_hash = response.parse

puts
puts "#{contact_hash['first_name']} #{contact_hash['last_name']}"
puts '=' * 50
puts
puts "Email: #{contact_hash['email']}"
puts "Phone Number: #{contact_hash['phone_number']}"

response = HTTP.get('http://localhost:3000/api/all_contacts_url')
contacts_array = response.parse

puts
puts 'All Contacts'
puts '~' * 60
puts 

contacts_array.each do |contact|
  puts "#{contact['first_name']} #{contact['last_name']}"
  puts "Email: #{contact['email']}"
  puts "Phone Number: #{contact['phone_number']}"
  puts
end 
