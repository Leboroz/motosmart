class CreateKilometers < ActiveRecord::Migration[7.0]
  def change
    create_table :kilometers do |t|
      t.float :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
