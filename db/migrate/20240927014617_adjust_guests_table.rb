class AdjustGuestsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :guests, :email, :string
    remove_column :guests, :name, :string
    add_column :guests, :first_name, :string
    add_column :guests, :last_name, :string
  end
end
