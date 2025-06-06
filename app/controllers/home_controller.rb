class HomeController < ApplicationController
  layout 'styled'
  def index
    @show_modal = session.delete(:show_modal) 
    @attending = session.delete(:attending) 
    @show_info = true
  end
end
