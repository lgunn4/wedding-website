class HomeController < ApplicationController
  def index
    @debug_rsvp = params[:debug] == 'rsvp'

    if @debug_rsvp
      @guest = Guest.new
      @guest.build_address
      @guest.song_requests.build
    end
  end
end
