# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

guests = Guest.create([
  { name: 'John Doe', email: 'john@example.com', number_of_guests: 2 },
  { name: 'Jane Smith', email: 'jane@example.com', number_of_guests: 1 },
  { name: 'Bob Johnson', email: 'bob@example.com', number_of_guests: 4 }
])

Address.create([
  { street: '123 Main St', line_2: 'Apt 4', city: 'Cityville', province: 'Stateville', postal_code: '12345', country: "Canada", guest: guests[0] },
  { street: '456 Oak St', line_2: 'Suite 7', city: 'Townsville', province: 'Stateville', postal_code: '67890', country: "Canada", guest: guests[1] },
  { street: '789 Pine St', line_2: 'Unit 12', city: 'Villageton', province: 'Stateville', postal_code: '54321', country: "Canada", guest: guests[2] }
])

puts 'Seeds successfully created!'