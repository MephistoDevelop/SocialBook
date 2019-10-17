# frozen_string_literal: true

FactoryBot.define do
  factory :reaction do
    post_id { 1 }
    user_id { 1 }
    user_reaction { "MyString" }
  end

  factory :comment do
    content { "MyText" }
    author { 1 }
  end

  factory :user do

    trait :controller_likes do
      username { 'controller likes' }
      email { 'controller_likes@mail.com' }
      password { 123456 }
      password_confirmation { 123456 }
    end


    trait :controller_post do
      username { 'controller post' }
      email { 'controller_post@mail.com' }
      password { 123456 }
      password_confirmation { 123456 }
    end

    trait :controller_comments do
      username { 'controller comments' }
      email { 'controller_comments@mail.com' }
      password { 123456 }
      password_confirmation { 123456 }
    end

    trait :ines do
      username { 'Ines' }
      email { 'ines@gmail.com' }
      password { 123456 }
      password_confirmation { 123456 }
    end
  end


    trait :checo do
      username { 'checo' }
      email { 'checo@gmail.com' }
      password { 123_456 }
      password_confirmation { 123_456 }
    end

    trait :johny do
      username { 'johny' }
      email { 'johny@gmail.com' }
      password { 123_456 }
      password_confirmation { 123_456 }
    end
  end

  factory :post do

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
end
