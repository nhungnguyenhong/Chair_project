class CreateRecommendHistory < ActiveRecord::Migration[5.0]
  def change
    create_table :recommend_histories do |t|
      t.integer :user_id
      t.integer :chair_id
      t.timestamps
    end
  end
end
