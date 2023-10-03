class ChangeGuestIdToNullableInSongRequests < ActiveRecord::Migration[6.1]
  def change
    change_column :song_requests, :guest_id, :integer, null: true
  end
end
