class AddNotNullConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null :addresses, :customer_id, false
    change_column_null :addresses, :name, false
    change_column_null :addresses, :postal_code, false
    change_column_null :addresses, :address, false

    # change_column_null :cart_items, :item_id, false
    # change_column_null :cart_items, :customer_id, false
    # change_column_null :cart_items, :amount, false

    # change_column_null :genres, :name, false

    # change_column_null :items, :genre_id, false
    # change_column_null :items, :name, false
    # change_column_null :items, :introduction, false
    # change_column_null :items, :price, false
    # change_column_null :items, :is_active, false

    # change_column_null :order_details, :item_id, false
    # change_column_null :order_details, :customer_id, false
    # change_column_null :order_details, :amount, false
    # change_column_null :order_details, :order_price, false
    # change_column_null :order_details, :making_status, false, default: 1

    # change_column_null :orders, :item_id, false
    # change_column_null :orders, :delivery_name, false
    # change_column_null :orders, :delivery_postal_code, false
    # change_column_null :orders, :delivery_address, false
    # change_column_null :orders, :postage, false, default: 800
    # change_column_null :orders, :billing_amount, false
    # change_column_null :orders, :payment_method, false
    # change_column_null :orders, :order_status, false, default: 1

  end
end
