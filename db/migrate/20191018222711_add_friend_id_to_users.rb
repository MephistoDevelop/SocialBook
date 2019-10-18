class AddFriendIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :friend_id, :integer
  end
end
