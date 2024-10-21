# frozen_string_literal: true

class RsvpMailer < ApplicationMailer
  def confirmation_email(rsvp)
    @rsvp = rsvp
    mail(to: @rsvp.email, subject: '💌 Thanks! Your RSVP is confirmed')
  end

  def alert_email(rsvp)
    @rsvp = rsvp
    @number_of_guests = Guest.all.count
    mail(to: User.all.map(&:email), subject: 'A new RSVP has been submitted!')
  end
end
