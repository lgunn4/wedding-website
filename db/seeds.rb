# frozen_string_literal: true

# Clear existing data
Address.delete_all
Guest.delete_all
SongRequest.delete_all
Rsvp.delete_all
User.delete_all

# Create an RSVP record (since guests and song requests need it)
rsvp = Rsvp.create(email: 'rsvp@example.com')

# Create guests with rsvp_id
guests = Guest.create([
  { name: 'John Doe', email: 'john@example.com', rsvp_id: rsvp.id },
  { name: 'Jane Smith', email: 'jane@example.com', rsvp_id: rsvp.id },
  { name: 'Bob Johnson', email: 'bob@example.com', rsvp_id: rsvp.id }
])

# Create addresses for guests with rsvp_id
Address.create([
  { street: '123 Main St', line_2: 'Apt 4', city: 'Cityville', province: 'Stateville', postal_code: '12345', country: 'Canada', rsvp_id: rsvp.id },
  { street: '456 Oak St', line_2: 'Suite 7', city: 'Townsville', province: 'Stateville', postal_code: '67890', country: 'Canada', rsvp_id: rsvp.id },
  { street: '789 Pine St', line_2: 'Unit 12', city: 'Villageton', province: 'Stateville', postal_code: '54321', country: 'Canada', rsvp_id: rsvp.id }
])

# Create song requests for guests with rsvp_id
SongRequest.create([
  { title: 'Song 1', artist: 'Artist 1', rsvp_id: rsvp.id },
  { title: 'Song 2', artist: 'Artist 2', rsvp_id: rsvp.id },
  { title: 'Song 3', artist: 'Artist 3', rsvp_id: rsvp.id },
  { title: 'Song 4', artist: 'Artist 4', rsvp_id: rsvp.id }
])

# Create a user
User.create(email: 'admin@example.com', password_digest: BCrypt::Password.create('password'), first_name: 'Admin', last_name: 'User')

Rails.logger.debug 'Seeds successfully created!'
