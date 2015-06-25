class AddLocationLattitudeLongitudeToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :location, :string
    add_column :todos, :latitude, :float
    add_column :todos, :longitude, :float
  end
end
