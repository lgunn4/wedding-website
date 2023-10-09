class AddUniqueConstraintToEmailInGuests < ActiveRecord::Migration[6.0] # Change the version as needed
  def change
    add_index :guests, :email, unique: true
  end
end
