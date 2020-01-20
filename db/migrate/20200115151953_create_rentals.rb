class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :returned
      t.date :return_date
      t.date :rent_date

      t.timestamps
    end
  end
end
