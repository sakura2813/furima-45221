class CreateShippingAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code
      t.integer :prefecture_id
      t.string :city
      t.string :street_address
      t.string :building
      t.string :phone_number
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
