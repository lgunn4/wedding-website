class HomeController < ApplicationController
  def index
    @debug_rsvp = params[:debug] == 'rsvp'
  end
end
