class CreateDeliverAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :deliver_addresses do |t|
      t.integer    :post_code,                    null: false
      t.integer    :prefectuer_code,              null: false
      t.string     :city,                         null: false
      t.string     :house_number,                 null: false
      t.string     :building_name
      t.integer    :phone_number,                 unique: true
      t.references :user,                         null: false, foreign_key: true
      t.string     :destination_first_name,       null: false
      t.string     :destination_family_name,      null: false
      t.string     :destination_first_name_kana,  null: false
      t.string     :destination_family_name_kana, null: false
      t.timestamps
    end
    add_index :deliver_addresses, :phone_number,  unique: true
  end
end
