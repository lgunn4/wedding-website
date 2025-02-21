class AddCompletedToRsvp < ActiveRecord::Migration[7.0]
  def change
    add_column :rsvps, :complete, :boolean, null: false, default: false
  end
end
