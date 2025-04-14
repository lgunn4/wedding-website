# Preview all emails at http://localhost:3000/rails/mailers/guest_mailer
class RsvpMailerPreview < ActionMailer::Preview
  def confirmation_email
    @rsvp = Rsvp.last
    RsvpMailer.confirmation_email(@rsvp)
  end

  def alert_email
    @rsvp = Rsvp.last
    RsvpMailer.alert_email(@rsvp)
  end

  def incomplete_rsvp_email
    @rsvp = Rsvp.last
    RsvpMailer.incomplete_rsvp_email(@rsvp)
  end
end
