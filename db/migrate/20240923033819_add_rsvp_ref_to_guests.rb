class AddRsvpRefToGuests < ActiveRecord::Migration[7.0]
  def change
    add_reference :guests, :rsvp, null: true, foreign_key: true
  end
end
