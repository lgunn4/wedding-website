# frozen_string_literal: true

class CreateSongRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :song_requests do |t|
      t.string :title
      t.string :artist
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
