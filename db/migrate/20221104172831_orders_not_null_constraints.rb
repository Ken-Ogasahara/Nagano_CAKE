class OrdersNotNullConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null :orders, :item_id, false
    change_column_null :orders, :delivery_name, false
    change_column_null :orders, :delivery_postal_code, false
    change_column_null :orders, :delivery_address, false
    change_column_null :orders, :postage, false
    change_column_default(:orders, :postage, from: nil, to: 800)
    change_column_null :orders, :billing_amount, false
    change_column_null :orders, :payment_method, false
    change_column_null :orders, :order_status, false
    change_column_default(:orders, :order_status, from: nil, to: 1)
  end
end
