class Rsvp < ApplicationRecord
    has_many :guests
    has_one :address
    has_many :song_requests
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    accepts_nested_attributes_for :address
    accepts_nested_attributes_for :song_requests, reject_if: :all_blank, allow_destroy: true
end
  