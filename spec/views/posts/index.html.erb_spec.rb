require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do
  it 'posts show content and author name' do
    user = User.create(username: 'Example', email: 'Example@mail.com',
                    password: '123456', password_confirmation: '123456')
    sign_in user
    post = Post.new(content: 'Example test', user_id: 1)
    visit '/posts'
    expect(page).to have_content('Fakebook')
    expect(page).to have_content('Name')
    expect(page).to have_content('Email')
  end
end
