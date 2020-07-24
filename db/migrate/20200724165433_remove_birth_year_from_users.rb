class RemoveBirthYearFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :birth_year, :date
    remove_column :users, :birth_month, :date
    rename_column :users, :birth_day, :birth_date
  end
end
