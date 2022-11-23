class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.integer :item_id,       null: false, default: ""
      t.integer :customer_id,   null: false, default: ""
      t.integer :amount
      t.integer :order_price
      t.integer :making_status,              default: ""

      t.timestamps
    end
  end
end
