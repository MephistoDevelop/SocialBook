require 'rails_helper'

RSpec.describe UsersController, type: :controller, js:true do

  it 'retrieves all users' do
    visit '/users'
    expect(page).to have_content(@username)
  end

end
