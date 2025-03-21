# frozen_string_literal: true

class RsvpMailer < ApplicationMailer
  def confirmation_email(rsvp)
    @rsvp = rsvp
    mail(to: @rsvp.email, subject: '💌 Thank you! We have received your RSVP')
  end

  def alert_email(rsvp)
    @rsvp = rsvp
    @attending_guests = Rsvp.attending_guests.count
    mail(to: User.all.map(&:email), subject: 'A new RSVP has been submitted')
  end
end
