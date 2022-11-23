class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :item_id,             null: false, default: ""
      t.string :delivery_name,        null: false, default: ""
      t.string :delivery_postal_code, null: false, default: ""
      t.text :delivery_address,       null: false, default: ""
      t.integer :postage,                          default: 800
      t.integer :billing_amount
      t.integer :payment_method
      t.integer :order_status,                     default: 1

      t.timestamps
    end
  end
end
