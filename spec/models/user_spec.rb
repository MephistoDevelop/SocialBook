require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without a first name" do
    user = User.new(username: nil)
    user.valid?
  end
end
