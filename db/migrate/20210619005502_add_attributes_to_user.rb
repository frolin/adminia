class AddAttributesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :third_name, :string
    add_column :users, :locality, :string
    add_column :users, :username, :string

  end
end
