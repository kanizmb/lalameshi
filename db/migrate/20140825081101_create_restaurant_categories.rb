class CreateRestaurantCategories < ActiveRecord::Migration
  def change
    create_table :restaurant_categories do |t|
      t.references :restaurant, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
