class AddOrderedCarriageToTrain < ActiveRecord::Migration[5.2]
  def change
    add_column :trains, :order_carriage, :boolean, default: false
  end
end
