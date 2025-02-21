class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @rsvps = Rsvp.order(complete: "DESC").includes(:guests, :song_requests).all

    @completed_guest_count = Rsvp.completed_guests.count
    @completed_bus_guest_count = Rsvp.completed_bus_guests.count
    @completed_song_request_count = @rsvps.select {|rsvp| rsvp.complete? }.flat_map(&:song_requests).count

    @guests = @rsvps.flat_map(&:guests)
    @song_requests = @rsvps.flat_map(&:song_requests)
  end
end