class AddColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    #not null制約
    change_column :customers, :last_name, :string, :null => false
    change_column :customers, :first_name, :string, :null => false

    # カラム追加&not null制約
    add_column :customers, :last_name_kana, :string
    change_column :customers, :last_name_kana, :string, :null => false

    add_column :customers, :first_name_kana, :string
    change_column :customers, :first_name_kana, :string, :null => false

    add_column :customers, :postal_code, :string
    change_column :customers, :postal_code, :string, :null => false

    add_column :customers, :address, :string
    change_column :customers, :address, :string, :null => false

    add_column :customers, :telephone_number, :string
    change_column :customers, :telephone_number, :string, :null => false

    add_column :customers, :is_deleted, :boolean, default: false, :null => false

  end
end
