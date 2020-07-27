class ChangeDataPostCodePhoneNumberToDeliverAddress < ActiveRecord::Migration[6.0]
  def change
    change_column :deliver_addresses, :post_code, :string
    change_column :deliver_addresses, :phone_number, :string
  end
end
