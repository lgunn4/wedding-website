# app/controllers/guests_controller.rb
class GuestsController < ApplicationController
  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      render json: { success: true, guest_name: @guest.name }
    else
      error_json = @guest.errors.errors.each_with_object({}) do |error, hash|
        hash[error.attribute] = error.full_message
      end

      render json: { success: false, errors: @guest.errors.full_messages, error_json: }
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :email, :number_of_guests,
                                  address_attributes: %i[street line_2 city province postal_code country], song_requests_attributes: %i[title artist])
  end
end
