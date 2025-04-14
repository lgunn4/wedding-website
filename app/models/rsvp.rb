class Rsvp < ApplicationRecord
    include SqidsEncodable

    STEPS = [
        "enter_email", 
        "enter_guests",
        "attending_confirmation",
        "enter_bus_info",
        "enter_songs",
        "submit"
    ]

    has_many :guests, dependent: :destroy
    has_many :song_requests, dependent: :destroy
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_nil: true
    validates :step, :inclusion=> { :in => STEPS }

    scope :complete , -> { where(complete: true) }
    scope :attending_song_requests, -> { where(attending: true, complete: true).includes(:song_requests).flat_map(&:song_requests) }
    scope :attending_guests, -> { where(attending: true, complete: true).includes(:guests).flat_map(&:guests) }
    scope :attending_bus_guests, -> { where(attending: true, complete: true, bus_required: true).includes(:guests).flat_map(&:guests) }


    after_commit :enqueue_send_incomplete_rsvp_email, on: [:create]

    def number_of_guests 
        self.guests.count
    end

    def complete!
        update!(complete: true)
    end

    def enqueue_send_incomplete_rsvp_email
        SendIncompleteRsvpEmailJob.set(wait_until: Date.tomorrow.noon).perform_later(rsvp_id: id)
    end

    def current_step_url
        index = Rsvp::STEPS.index(step)
        next_step = Rsvp::STEPS[index + 1] || Rsvp::STEPS.last

        "#{Rails.configuration.base_path}/rsvps/#{sqid}/edit?step=#{next_step}"
    end
end
  