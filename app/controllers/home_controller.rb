class HomeController < ApplicationController
  before_action :check_for_lockup

  def index
    @guest = Guest.new
    @guest.build_address
    @guest.song_requests.build
  end
end
