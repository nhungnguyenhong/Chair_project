class CreateBillings < ActiveRecord::Migration[5.0]
  def change
    create_table :billings do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :city
      t.string :address
      t.string :phone_number
      t.string :email
      t.text :note
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :shipping, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      t.integer :payment_method
      t.integer :status
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.datetime :expires_at
      t.datetime :purchased_at
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
