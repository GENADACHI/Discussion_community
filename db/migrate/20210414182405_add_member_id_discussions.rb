class AddMemberIdDiscussions < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM discussions'
    add_reference :discussions, :member, null: false, index: true
  end
  def down
    remove_reference :discussions, :member, index: true
  end
end
