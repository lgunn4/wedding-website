# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :line_2
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :country
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
