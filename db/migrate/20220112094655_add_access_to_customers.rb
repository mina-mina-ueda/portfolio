class AddAccessToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :access, :string
  end
end
