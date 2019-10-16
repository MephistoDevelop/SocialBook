require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it "index return all posts" do
    get :index
  end
end
