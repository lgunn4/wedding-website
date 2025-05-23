class RsvpsController < ApplicationController
    layout 'styled'
    before_action :fetch_step, only: [:edit, :update]
    before_action :fetch_rsvp, only: [:new, :create, :edit, :update]
    before_action :set_first_step

    STEPS = [
        "enter_email", 
        "enter_guests",
        "attending_confirmation",
        "enter_bus_info",
        "enter_songs",
        "submit"
    ]

    def new
        @step = STEPS[0]
    end

    def create
        @step = STEPS[0]
        update
    end

    def update
        case @step
        when "enter_guests"
            @guests = create_guests_from_input
            @guests.each(&:save!)

        when "enter_email"
            @rsvp.update(email_params)
        
        when "attending_confirmation"
            @rsvp.update(attending_confirmation_params)

            return redirect_to_not_attending unless @rsvp.attending? 
        when "enter_bus_info"
            @rsvp.update(bus_info_params)

        when "enter_songs"
            @song_requests = create_song_requests_from_input
            @song_requests.each(&:save!)
        end

        redirect_to_next_step
    end

    private

    def set_first_step 
        @first_step = STEPS.find_index(@step) == 1
    end

    def redirect_to_not_attending
        unless @rsvp.complete?
            @rsvp.complete!
            RsvpMailer.alert_email(@rsvp).deliver_later
        end

        session[:show_modal] = true
        session[:attending] = false

        redirect_to "/"
    end

    def last_step
        unless @rsvp.complete?
            @rsvp.complete!
            RsvpMailer.confirmation_email(@rsvp).deliver_later
            RsvpMailer.alert_email(@rsvp).deliver_later
        end
        
        session[:show_modal] = true
        session[:attending] = true

        redirect_to "/"
    end

    def redirect_to_next_step
        return last_step if next_step.nil?

        redirect_to "/rsvps/#{@rsvp.to_param}/edit?step=#{next_step}"
    end

    def next_step
        index = STEPS.find_index(@step)
        return nil if index == STEPS.count - 1

        return STEPS[index + 1]
    end

    def fetch_rsvp
        @rsvp = Rsvp.new unless params[:id]
        @rsvp ||= Rsvp.find_by_sqid(params[:id])
    end

    def fetch_step
        @step = params["step"]
        @step ||= params["rsvp"]["step"]
    end

    def email_params
        params.require(:rsvp).permit(:email)  
    end

    def attending_confirmation_params
        params.require(:rsvp).permit(:attending)
    end

    def bus_info_params
        params.require(:rsvp).permit(:bus_required)  
    end

    def create_guests_from_input
        @guests = []
        number_of_guests = params["rsvp"]["number_of_guests"].to_i

        @rsvp.guests.destroy_all

        (0...number_of_guests).each do |i|
            guest = Guest.new(params["rsvp"][i.to_s].permit(:first_name, :last_name))
            guest.rsvp = @rsvp
            @guests << guest
        end

        @guests
    end

    def create_song_requests_from_input
        @song_requests = []
        number_of_songs = params["rsvp"]["number_of_songs"].to_i

        @rsvp.song_requests.destroy_all

        (0...number_of_songs).each do |i|
            song_request = SongRequest.new(params["rsvp"][i.to_s].permit(:title, :artist))
            song_request.rsvp = @rsvp
            @song_requests << song_request
        end

        @song_requests
    end

    def song_request_params
        params.require(:rsvp).permit(:title, :artist)
    end
end


