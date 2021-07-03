class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :alias
      t.text :description

      t.timestamps
    end
  end
end
