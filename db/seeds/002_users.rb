# frozen_string_literal: true

# Create users
10.times do
  User.create!(email: Faker::Internet.email,
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               username: Faker::Internet.username,
               password: 'password',
               password_confirmation: 'password')
end
