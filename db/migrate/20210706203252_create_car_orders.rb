class CreateCarOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :car_orders do |t|
      t.string :title
      t.string :number
      t.boolean :active
      t.references :user

      t.timestamps
    end
  end
end
