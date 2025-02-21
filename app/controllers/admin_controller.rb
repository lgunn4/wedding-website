class AdminController < ApplicationController
  before_action :authenticate_user!

  layout 'admin'
  
  def index
    @rsvps =  Rsvp.order(complete: "DESC").includes(:guests, :song_requests).all
    @guests = @rsvps.flat_map(&:guests)
    @song_requests = @rsvps.flat_map(&:song_requests)
  end
end