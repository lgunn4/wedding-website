# frozen_string_literal: true

# app/mailers/guest_mailer.rb
class RsvpMailer < ApplicationMailer
  def confirmation_email(rsvp)
    @rsvp = rsvp
    mail(to: @rsvp.email, subject: '💌 Thanks! Your RSVP is confirmed')
  end
end
