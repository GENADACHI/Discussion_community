class AddAdminToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :admin, :boolean, default: false, null: false
  end
end
