class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :user_reaction

      t.timestamps
    end
  end
end
