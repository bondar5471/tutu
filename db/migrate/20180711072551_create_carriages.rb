class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :econom_seats
      t.references :train, index: true
      t.string :type
      t.integer :train_id

      t.timestamps null: false
    end
  end
end
