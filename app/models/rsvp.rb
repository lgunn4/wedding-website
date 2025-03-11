class Rsvp < ApplicationRecord
    include SqidsEncodable

    has_many :guests, dependent: :destroy
    has_many :song_requests, dependent: :destroy
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_nil: true
    scope :complete , -> { where(complete: true) }
    scope :attending_song_requests, -> { where(attending: true, complete: true).includes(:song_requests).flat_map(&:song_requests) }
    scope :attending_guests, -> { where(attending: true, complete: true).includes(:guests).flat_map(&:guests) }
    scope :attending_bus_guests, -> { where(attending: true, complete: true, bus_required: true).includes(:guests).flat_map(&:guests) }


    def number_of_guests 
        self.guests.count
    end

    def complete!
        update!(complete: true)
    end
end
  