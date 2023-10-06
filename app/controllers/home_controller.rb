class HomeController < ApplicationController
  def index
    @guest = Guest.new
    @guest.build_address
    @guest.song_requests.build
  end
end
