# app/controllers/guests_controller.rb
class GuestsController < ApplicationController
  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      redirect_to root_path, notice: 'Thank you for your RSVP!'
    else
      render :home
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :email, :number_of_guests, address_attributes: [:street, :line_2, :city, :province, :postal_code, :country], song_requests_attributes: [:title, :artist])
  end
end
