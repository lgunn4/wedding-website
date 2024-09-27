class AddRsvpRefToGuests < ActiveRecord::Migration[7.0]
  def change
    add_reference :guests, :rsvp, null: false, foreign_key: true
  end
end
