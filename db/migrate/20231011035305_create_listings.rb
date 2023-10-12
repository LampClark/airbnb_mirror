class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :property_type
      t.decimal :price, precision: 10, scale: 2
      t.string :location
      t.text :description
      t.string :title
      t.integer :rooms, default: 0
      t.integer :capacity, default: 0
      t.references :user, null: false, foreign_key: true
      t.boolean :available, default: false
      t.float :avg_rating, precision: 5, scale: 2

      t.timestamps
    end
  end
end
