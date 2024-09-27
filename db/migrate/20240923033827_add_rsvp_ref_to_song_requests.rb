class AddRsvpRefToSongRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :song_requests, :rsvp, null: true, foreign_key: true
  end
end
