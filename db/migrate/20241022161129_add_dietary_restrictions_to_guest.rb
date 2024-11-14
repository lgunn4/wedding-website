class AddDietaryRestrictionsToGuest < ActiveRecord::Migration[7.0]
  def change
    add_column :guests, :dietary_restriction, :text
  end
end
