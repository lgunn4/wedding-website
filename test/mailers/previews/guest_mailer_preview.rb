# Preview all emails at http://localhost:3000/rails/mailers/guest_mailer
class GuestMailerPreview < ActionMailer::Preview
  def confirmation_email
    @guest = Guest.last
    GuestMailer.confirmation_email(@guest)
  end
end
