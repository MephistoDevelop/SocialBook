class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :requestor_id
      t.integer :requested_id
      t.boolean :friendship_status

      t.timestamps
    end
  end
end
