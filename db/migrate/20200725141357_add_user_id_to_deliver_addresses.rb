class AddUserIdToDeliverAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :deliver_addresses, :user, foreign_key: true
  end
end
