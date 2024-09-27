# app/models/guest.rb
class Guest < ApplicationRecord
  belongs_to :rsvp
  has_many :song_requests, dependent: :destroy
  has_one :address

  validates :first_name, presence: true
  validates :last_name, presence: true 
end
