class DropTableToCategoryProducts < ActiveRecord::Migration[6.0]
  def change
    drop_table :category_products
  end
end
