User.create!(name:  "asdf",
             email: "asdf@jkl.com",
             password:              "123456",
             password_confirmation: "123456")

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
25.times do
  content = Faker::Lorem.sentence(5)
  title = "This is T"
  users.each { |user| user.entries.create!(content: content, title: title) }
end