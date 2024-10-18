class RemoveNumberOfGuestsFromGuests < ActiveRecord::Migration[7.0]
  def change
    remove_column :guests, :number_of_guests, :integer
  end
end
