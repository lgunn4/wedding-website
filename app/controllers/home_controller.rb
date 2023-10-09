class HomeController < ApplicationController
  def index
    if cookies[:guest_id]
      @guest = Guest.find(cookies[:guest_id])
    else
      @guest = Guest.new
      @guest.build_address
      @guest.song_requests.build
    end
  end
end
