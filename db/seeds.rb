# coding: utf-8

Faker::Config.locale = "ja"

admin = User.find_or_initialize_by(email: "sample@email.com")
admin.assign_attributes(name: "Sample User",
                         password: "password",
                         password_confirmation: "password",
                         admin: true)
admin.save!

60.times do |n|
  email = "sample-#{n+1}@email.com"
  next if User.exists?(email: email)
  User.create!(name: Faker::Name.name,
               email: email,
               password: "password",
               password_confirmation: "password")
end