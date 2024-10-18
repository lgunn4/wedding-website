class RemoveGuestRefFromAddresses < ActiveRecord::Migration[7.0]
  def change
    remove_reference :addresses, :guest, null: false, foreign_key: true
  end
end
