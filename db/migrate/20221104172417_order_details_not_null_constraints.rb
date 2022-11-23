class OrderDetailsNotNullConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null :order_details, :item_id, false
    change_column_null :order_details, :customer_id, false
    change_column_null :order_details, :amount, false
    change_column_null :order_details, :order_price, false
    change_column_null :order_details, :making_status, false
    change_column_default(:order_details, :making_status, from: nil, to: 1)
  end
end
