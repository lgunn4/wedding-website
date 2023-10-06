# app/controllers/guests_controller.rb
class GuestsController < ApplicationController
  before_action :set_guest, only: %i[show edit update destroy]

  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      render turbo_stream: turbo_stream.replace(
        'body', partial: 'shared/thank_you_modal'
      )
    else
      render json: { success: false, errors: @guest.errors.full_messages }
    end
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def guest_params
    params.require(:guest).permit(
      :name, :email, :number_of_guests,
      address_attributes: %i[street line_2 city province postal_code country],
      song_requests_attributes: %i[id title artist _destroy]
    )
  end
end
