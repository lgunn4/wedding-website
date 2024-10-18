class AddRsvpRefToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :rsvp, null: false, foreign_key: true
  end
end
