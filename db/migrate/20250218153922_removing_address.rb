class RemovingAddress < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :addresses, :rsvps
    drop_table :addresses
  end
end
