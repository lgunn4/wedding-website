class AddBusInfoToRsvp < ActiveRecord::Migration[7.0]
  def change
    add_column :rsvps, :bus_required, :boolean
  end
end
