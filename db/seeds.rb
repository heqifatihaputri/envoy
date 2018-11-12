# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(name: "Super Admin")
Role.create(name: "Global Admin")
Role.create(name: "Location Admin")
Role.create(name: "Front Desk Admin")
Role.create(name: "Security Admin")
Role.create(name: "Billing Admin")
Role.create(name: "Employee")
AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')