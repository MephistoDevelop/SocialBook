require 'rails_helper'

RSpec.describe UsersController, type: :controller, js:true do

    it "redirect to users index" do
        @user = FactoryBot.create :user, :johny
        get :index
        expect(response).to redirect_to(new_user_session_path)
    end

end
