class ChangeUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :img
      t.string :gender
      t.datetime :birthday
      t.integer :role
    end
  end
end
