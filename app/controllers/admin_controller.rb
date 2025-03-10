class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @guests = Rsvp.attending_guests
    @song_requests = Rsvp.attending_song_requests
    @bus_guests = Rsvp.attending_bus_guests
  end
end