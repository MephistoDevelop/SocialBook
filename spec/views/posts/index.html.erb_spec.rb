require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do
  it 'posts show content and author name' do
    user = User.create(username: 'Example', email: 'Example@mail.com',
                    password: '123456', password_confirmation: '123456')
    post = Post.create(content: 'Example test', user_id: 1)
    visit '/posts'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    visit '/posts'
    expect(page).to have_content('Fakebook')
    expect(page).to have_content('User')
  end
end
