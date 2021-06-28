class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true, null: false
      t.string :status
      t.datetime :date

      t.timestamps
    end
  end
end
