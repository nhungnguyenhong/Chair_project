class CreateRating < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :chair_id
      t.float :point
      t.timestamps
    end
  end
end
