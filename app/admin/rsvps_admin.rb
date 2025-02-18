Trestle.resource(:rsvps) do
  menu do
    item :rsvps, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :number_of_guests
    column :email

    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |rsvp|
    table rsvp.guests, admin: :guests do
      column :id, align: :left
      column :first_name, align: :left
      column :last_name, align: :left
    end


    table rsvp.song_requests, admin: :song_requests do
      column :id, align: :left
      column :title, align: :left
      column :artist, align: :left
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
