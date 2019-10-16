# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    content { "MyText" }
    author { 1 }
  end

  factory :user do
    trait :ines do
      username { 'Ines' }
      email { 'inesherald@gmail.com' }
      password { 123_456 }
      password_confirmation { 123_456 }
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
