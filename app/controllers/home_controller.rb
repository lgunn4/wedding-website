class HomeController < ApplicationController
  def index
    @debug_rsvp = params[:debug] == 'rsvp'
    @show_modal = session.delete(:show_modal) 
  end
end
