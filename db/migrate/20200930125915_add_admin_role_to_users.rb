class AddAdminRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin_role, :bool
  end
end
