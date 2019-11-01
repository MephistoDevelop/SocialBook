
FactoryBot.define do
  factory :reaction do
    post_id { 1 }
    user_id { 1 }
    user_reaction { 'MyString' }
  end

  factory :user do
    trait :controller_likes do
      username { 'controller likes' }
      email { 'controller_likes@mail.com' }
      password { 123_456 }
      password_confirmation { 123_456 }
    end

    trait :controller_post do
      username { 'controller post' }
      email { 'controller_post@mail.com' }
      password { 123_456 }
      password_confirmation { 123_456 }
    end

    trait :controller_comments do
      username { 'controller comments' }
      email { 'controller_comments@mail.com' }
      password { 123_456 }
      password_confirmation { 123_456 }
    end

    trait :ines do
      username { 'Ines' }
      sequence(:email) { |n| "tester_ines#{n}@example.com" }
      password { 123_456 }
      password_confirmation { 123_456 }
    end

    trait :checo do
      username { 'checo' }
      sequence(:email) { |n| "tester#{n}@example.com" }
      password { 123_456 }
      password_confirmation { 123_456 }
    end

    trait :friendship_requestor do
      username { 'friendship requestor' }
      email { 'friendship_requestor@gmail.com' }
      password { 123_456 }
      password_confirmation { 123_456 }
    end

    trait :friendship_requested do
      username { 'friendship requested' }
      email { 'friendship_requested@gmail.com' }
      password { 123_456 }
      password_confirmation { 123_456 }
    end

    trait :johny do
      username { 'johny' }
      email { 'johny@gmail.com' }
      password { 123_456 }
      password_confirmation { 123_456 }
    end

    trait :reactor do
      username { 'johny' }
      email { 'reactor@gmail.com' }
      password { 123_456 }
      password_confirmation { 123_456 }
    end
  end

  factory :post do
    trait :post_controller do
      content { 'Event created from factoryBot post_controller' }
      user_id { 1 }
    end

    trait :post_user do
      content { 'Event created from factoryBot post_users' }
      user_id { 1 }
    end

    trait :post_comment do
      content { 'Event created from factoryBot post_comments' }
      user_id { 1 }
    end

    trait :post_likes do
      content { 'Event created from factoryBot post_likes' }
      user_id { 1 }
    end

    trait :event1 do
      content { 'Event from factoryBot traits' }
      user_id { 1 }
    end

    trait :event2 do
      content { 'Event 2 from factoryBot traits' }
      user_id { 1 }
    end
  end

  factory :comment do
    # association :post, :event1, content: 'This is my factory comments post'
    # association :user, :checo, username: 'johny', email: 'johny@mail.com', password: '123456', password_confirmation: '123456'
    #  association :author, factory: [:user], username: 'johny', email: 'johny@mail.com', password: '123456', password_confirmation: '123456'
    # association :post, factory: [:post], content: 'Event created from factoryBot post_comments'
    content { 'MyText' }
  end
end
