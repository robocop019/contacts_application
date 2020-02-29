class RemoveContactIdFromGroups < ActiveRecord::Migration[5.2]
  def change  
    remove_column :groups, :contact_id, :integer
  end
end
