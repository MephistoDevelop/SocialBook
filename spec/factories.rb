FactoryBot.define do
  factory :users  do
    trait :ines do
      username { Ines }
      email { inesherald@gmail.com }
      password  { 123456 }
      password_confirmation { 123456 }
    end

    trait :checo do
      username { checo }
      email { checo@gmail.com }
      password  { 123456 }
      password_confirmation { 123456 }
    end
  end
end