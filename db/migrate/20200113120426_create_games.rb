class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :min_player_count
      t.integer :max_player_count
      t.float :deposit
      t.integer :publication_year
      t.float :rental_price

      t.timestamps
    end
  end
end
