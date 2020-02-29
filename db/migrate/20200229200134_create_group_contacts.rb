class CreateGroupContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :group_contacts do |t|
      t.integer :group_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
