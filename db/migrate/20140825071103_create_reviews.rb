class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user_name
      t.string :latency
      t.integer :paid
      t.text :review
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
