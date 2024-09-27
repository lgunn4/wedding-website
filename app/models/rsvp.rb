class Rsvp < ApplicationRecord
    include SqidsEncodable

    has_many :guests, dependent: :destroy
    has_one :address, dependent: :destroy
    has_many :song_requests, dependent: :destroy
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_nil: true
    
    # accepts_nested_attributes_for :address
    # accepts_nested_attributes_for :song_requests, reject_if: :all_blank, allow_destroy: true

    def number_of_guests 
        self.guests.count
    end
end
  