# frozen_string_literal: true

User.create!(name: 'Example User',
             email: 'example@rails.com',
             password: 'secret',
             password_confirmation: 'secret',
             admin: true)
99.times do |n|
  name = Faker::Name.name
  email = "example#{n+1}@rails.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
