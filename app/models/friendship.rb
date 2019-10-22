class Friendship < ApplicationRecord
    belongs_to :requestor, class_name: 'User'
    belongs_to :requested, class_name: 'User'

    def user_requestor
        User.where(id: self.requestor_id)
    end

    def user_requested
        User.where(id: self.requested_id)
    end

    def show_user_friends
        self.user_requestor
    end
end
