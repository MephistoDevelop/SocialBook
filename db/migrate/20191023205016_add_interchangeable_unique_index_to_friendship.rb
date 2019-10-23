# frozen_string_literal: true

class AddInterchangeableUniqueIndexToFriendship < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      dir.up do
        connection.execute('
            create unique index index_friendships_on_interchangable_requestor_id_and_requested_id on friendships(greatest(requestor_id,requested_id), least(requestor_id,requested_id));
            create unique index index_friendships_on_interchangable_requested_id_and_requestor_id on friendships(least(requestor_id,requested_id), greatest(requestor_id,requested_id));
        ')
      end

      dir.down do
        connection.execute('
            drop index index_friendships_on_interchangable_requestor_id_and_requested_id;
            drop index index_friendships_on_interchangable_requested_id_and_requestor_id;
        ')
      end
    end
  end
end
