class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :item_id, :customer_id
    rename_column :order_details, :item_id, :order_id
  end
end
