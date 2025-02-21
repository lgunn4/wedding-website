module Admin
  class RsvpsController < ApplicationController
    before_action :authenticate_user!

    layout 'admin'

    def show
      @rsvp = Rsvp.find(params[:id])
    end
  end
end