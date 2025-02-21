module Admin
  class RsvpsController < ApplicationController
    before_action :authenticate_user!

    def show
      @rsvp = Rsvp.find(params[:id])
    end

    def destroy
      Rsvp.find(params[:id]).destroy!
      redirect_to admin_path
    end
  end
end