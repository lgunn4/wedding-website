class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @guests = Rsvp.where(complete: true).includes(:guests).flat_map(&:guests)
    
    @attending_guests = Rsvp.attending_guests.count
    @song_requests = Rsvp.attending_song_requests
    @bus_guests = Rsvp.attending_bus_guests
  end
end