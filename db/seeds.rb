
# 1000.times do 
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name

#   contact = Contact.new(
#                         first_name: first_name,
#                         middle_name: Faker::Name.middle_name,
#                         last_name: last_name,
#                         email: Faker::Internet.free_email(name: "#{first_name}.#{last_name}"),
#                         phone_number: Faker::PhoneNumber.phone_number,
#                         bio: Faker::TvShows::Buffy.quote
#                         )

#   contact.save
# end

