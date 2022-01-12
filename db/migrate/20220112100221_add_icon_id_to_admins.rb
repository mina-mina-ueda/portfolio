class AddIconIdToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :icon_id, :string
  end
end
