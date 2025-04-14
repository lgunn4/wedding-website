class AddingStepStateToRsvp < ActiveRecord::Migration[7.0]
  def change
    add_column :rsvps, :step, :string, null: true
  end
end
