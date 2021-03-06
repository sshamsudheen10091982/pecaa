class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :product_id
      t.text :description
      t.integer :rating
      t.boolean :approved

      t.timestamps
    end
  end
end
