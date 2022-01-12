class AddWorkToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :work, :string
  end
end
