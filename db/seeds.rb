Admin.find_or_create_by!(id: 1) do |admin| 
  admin.email = "admin@admin.com"
  admin.password = "admin09password"
end 

test1 = User.find_or_create_by!(email: "test1@example.com") do |user|
  user.name = "test1"
  user.password = "password1"
end 

test2 = User.find_or_create_by!(email: "test2@example.com") do |user|
  user.name = "test2"
  user.password = "password2"
end 

test1 = User.find_or_create_by!(email: "test3@example.com") do |user|
  user.name = "test3"
  user.password = "password3"
end 

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
