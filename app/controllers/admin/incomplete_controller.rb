module Admin
  class IncompleteController < ApplicationController
    before_action :authenticate_user!

    def index
      @guests = Rsvp.where(complete: false).flat_map(&:guests)
    end
  end
end