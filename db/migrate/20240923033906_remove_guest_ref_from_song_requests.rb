class RemoveGuestRefFromSongRequests < ActiveRecord::Migration[7.0]
  def change
    remove_reference :song_requests, :guest, null: false, foreign_key: true
  end
end
