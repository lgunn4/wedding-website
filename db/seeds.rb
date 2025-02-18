# frozen_string_literal: true

# Clear existing data
Guest.delete_all
SongRequest.delete_all
Rsvp.delete_all
User.delete_all

# Create an RSVP record (since guests and song requests need it)
rsvps = Rsvp.create([{email: 'rsvp@example.com'}, {email: 'rsvp2@example.com'}])

# Create guests with rsvp_id
guests = Guest.create([
  { first_name: 'John', last_name: 'Doe', rsvp_id: rsvps[0].id },
  { first_name: 'Jane', last_name: 'Smith', rsvp_id: rsvps[0].id },
  { first_name: 'Bob', last_name: 'Johnson', rsvp_id: rsvps[1].id }
])

# Create song requests for guests with rsvp_id
SongRequest.create([
  { title: 'Song 1', artist: 'Artist 1', rsvp_id: rsvps[0].id },
  { title: 'Song 2', artist: 'Artist 2', rsvp_id: rsvps[0].id },
  { title: 'Song 3', artist: 'Artist 3', rsvp_id: rsvps[1].id },
  { title: 'Song 4', artist: 'Artist 4', rsvp_id: rsvps[1].id }
])

# Create a user
User.create(email: 'admin@example.com', password_digest: BCrypt::Password.create('password'), first_name: 'Admin', last_name: 'User')

Rails.logger.debug 'Seeds successfully created!'
