Trestle.resource(:rsvps) do
  menu do
    item :rsvps, icon: "fa fa-star", priority: :first 
    
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :gid, ->(rsvp) { rsvp.to_param }
    column :number_of_guests
    column :email

    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |rsvp|

    table [rsvp] do
      column :edit_url, ->(rsvp) { "https://loganandbri.love/rsvps/#{rsvp.to_param}/edit?step=enter_email" }
    end

    table rsvp.guests, header: "Guests", admin: :guests do
      column :first_name
      column :last_name
    end


    table rsvp.song_requests, header: "Song Requests", admin: :song_requests do
      column :title 
      column :artist
    end


    text_field :email
    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:rsvp).permit(:name, ...)
  # end
end
