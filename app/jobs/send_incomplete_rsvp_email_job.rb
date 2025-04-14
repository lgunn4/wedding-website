class SendIncompleteRsvpEmailJob < ApplicationJob
  queue_as :default

  def perform(args)
    rsvp = Rsvp.find_by_id(args[:rsvp_id])

    return unless rsvp
    return if rsvp.email.nil?
    return if rsvp.complete?

    RsvpMailer.incomplete_rsvp_email(rsvp)
  end
end
