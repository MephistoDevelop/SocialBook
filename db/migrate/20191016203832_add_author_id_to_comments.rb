class AddAuthorIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :author_id, :integer
  end
end
