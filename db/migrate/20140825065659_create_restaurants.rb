class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.text :address
      t.string :tel
      t.string :holiday
      t.string :image
      t.integer :budget
      t.integer :tabelog_id
      t.float :tabelog_score
      t.integer :time_required
      t.integer :distance
      t.string :geocode

      t.timestamps
    end
  end
end
