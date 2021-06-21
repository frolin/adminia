class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.decimal :goal_price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
