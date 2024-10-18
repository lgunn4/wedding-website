# frozen_string_literal: true

Trestle.resource(:guests) do
  menu do
    item :guests, icon: 'fa fa-user'
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :first_name
    column :last_name

    column :created_at, align: :center
    actions
  end

  
  form do |guest|
    row do 
      col { text_field :first_name }
      col { text_field :last_name }
    end
  
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
  #   params.require(:guest).permit(:name, ...)
  # end
end
