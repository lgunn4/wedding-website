module Admin
  class RsvpsController < ApplicationController
    layout 'admin'

    def show
      @rsvp = Rsvp.find(params[:id])
    end
  end
end