# frozen_string_literal: true

# app/mailers/guest_mailer.rb
class GuestMailer < ApplicationMailer
  def confirmation_email(guest)
    @guest = guest
    mail(to: @guest.email, subject: '💌 Thanks! Your RSVP is confirmed')
  end
end
