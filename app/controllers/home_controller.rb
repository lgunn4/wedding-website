class HomeController < ApplicationController
  layout 'styled'
  def index
    @debug_rsvp = params[:debug] == 'rsvp'
    @show_modal = session.delete(:show_modal) 
  end
end
