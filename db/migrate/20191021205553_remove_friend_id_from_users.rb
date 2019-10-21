class RemoveFriendIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :friend_id, :integer
  end
end
