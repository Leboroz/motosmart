class AddColumnsToKilometer < ActiveRecord::Migration[7.0]
  def change
    add_column :kilometers, :start_date, :date
    add_column :kilometers, :finish_date, :date
  end
end
