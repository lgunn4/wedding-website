# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.integer :number_of_guests

      t.timestamps
    end
  end
end
