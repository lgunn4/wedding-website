# app/models/guest.rb
class Guest < ApplicationRecord
  belongs_to :rsvp
  has_many :song_requests, dependent: :destroy
  has_one :address

  validates :name, presence: true
end
