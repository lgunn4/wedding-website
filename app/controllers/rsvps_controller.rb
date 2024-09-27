class RsvpsController < ApplicationController
    before_action :fetch_step, only: [:edit, :update]
    before_action :fetch_rsvp, only: [:edit, :update]


    def new
        @rsvp = Rsvp.new
        @rsvp.save!

        @step = "enter_guests"
        redirect_to "/rsvps/#{@rsvp.id}/edit?step=#{@step}"
    end

    def create
        @rsvp = Rsvp.new
        @rsvp.save

        redirect_to "/rsvps/#{@rsvp.id}/edit?step=enter_email"
    end

    def update
        case @step
        when "enter_guests"
            @guests = create_guests_from_input
            @guests.update(rsvp: @rsvp)
            @guests.save!
            redirect_to "/rsvps/#{@rsvp.id}/edit?step=enter_email"

        when "enter_email"
            @rsvp.update(rsvp_params)
            redirect_to "/rsvps/#{@rsvp.id}/edit?step=enter_contact_information"

        when "enter_contact_information"
            @address = create_address_from_input
            @address.update(rsvp: @rsvp)
            @address.save!
            redirect_to "/rsvps/#{@rsvp.id}/edit?step=add_song_requests"

        when "add_song_requests"
            @song_requests = create_song_requests_from_input
            @song_requests.update(rsvp: @rsvp)
            @song_requests.save!

            redirect_to "/"
        end
    end

    private

    def fetch_rsvp
        @rsvp = Rsvp.find(params["id"])
    end

    def fetch_step
        @step = params["step"]
        @step ||= params["rsvp"]["step"]
    end

    def create_rsvp_from_input
        @rsvp = Rsvp.new(rsvp_params)
    end

    def rsvp_params
        params.require(:rsvp).permit(:email)  
    end

    def create_address_from_input
        @address = Address.new(address_params)
    end

    def address_params
        params.require(:rsvp).permit(:street, :line_2, :city, :province, :postal_code, :country)
    end

    def create_guests_from_input
        @guest = Guest.new(guest_params)
    end

    def guest_params
        params.require(:rsvp).permit(:first_name, :last_name)
    end

    def create_song_requests_from_input
        @song_requests = SongRequest.new(song_request_params)
    end

    def song_request_params
        params.require(:rsvp).permit(:title, :artist)
    end
end


