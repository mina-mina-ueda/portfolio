class RemoveIconIdFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :icon_id, :string
  end
end
