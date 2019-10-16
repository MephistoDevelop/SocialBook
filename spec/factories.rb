FactoryBot.define do
  factory :user  do
    trait :ines do
      username { "Ines" }
      email {"inesherald@gmail.com" }
      password  { 123456 }
      password_confirmation { 123456 }
    end

    trait :checo do
      username { "checo" }
      email { "checo@gmail.com" }
      password  { 123456 }
      password_confirmation { 123456 }
    end
  end

  factory :post do
    trait :event1 do
      content { "Event from factoryBot traits"}
      user_id { 1 }
    end
    trait :event2 do
      content { "Event 2 from factoryBot traits"}
      user_id { 1 }
    end
  end
end