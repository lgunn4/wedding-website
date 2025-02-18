# app/models/guest.rb
class Guest < ApplicationRecord
  belongs_to :rsvp

  validates :first_name, presence: true
  validates :last_name, presence: true 
end
