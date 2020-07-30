class RemoveUserIdFromDeliverAddress < ActiveRecord::Migration[6.0]
  def change
    remove_column :deliver_addresses, :user_id, :bigint
  end
end
