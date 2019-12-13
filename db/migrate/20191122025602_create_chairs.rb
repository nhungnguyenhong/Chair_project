class CreateChairs < ActiveRecord::Migration[5.0]
  def change
    create_table :chairs do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.string :function
      t.string :img
      t.text :description
      t.integer :price
      t.integer :quantity
      t.float :rating, :default => 0.0
    end
  end
end
