class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :details

      t.references :destination

      t.timestamps null: false
    end
  end
end
