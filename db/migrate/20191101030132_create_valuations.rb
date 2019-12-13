class CreateValuations < ActiveRecord::Migration[5.0]
  def change
    create_table :valuations do |t|
      t.integer :chair_id
      t.integer :user_id
      t.string :content
    end
  end
end
