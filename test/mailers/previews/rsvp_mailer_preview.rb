# Preview all emails at http://localhost:3000/rails/mailers/guest_mailer
class RsvpMailerPreview < ActionMailer::Preview
  def confirmation_email
    @rsvp = Rsvp.last
    RsvpMailer.confirmation_email(@rsvp)
  end
end
