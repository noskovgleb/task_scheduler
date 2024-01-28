class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :due_date, null: false
      t.integer :priority
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
