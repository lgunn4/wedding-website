class Rsvp < ApplicationRecord
    include SqidsEncodable

    has_many :guests, dependent: :destroy
    has_many :song_requests, dependent: :destroy
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_nil: true
    scope :complete , -> { where(complete: true) }
    scope :completed_guests, -> { where(complete: true).includes(:guests).flat_map(&:guests) }
    scope :completed_bus_guests, -> { where(bus_required: true).includes(:guests).flat_map(&:guests) }


    def number_of_guests 
        self.guests.count
    end

    def complete!
        update!(complete: true)
    end
end
  