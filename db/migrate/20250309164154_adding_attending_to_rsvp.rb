class AddingAttendingToRsvp < ActiveRecord::Migration[7.0]
  def change
    add_column :rsvps, :attending, :boolean, null: false, default: true
  end
end
