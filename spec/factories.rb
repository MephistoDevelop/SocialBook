FactoryBot.define do
  factory :user do
    username { "John" }
    email  { "dow@gmail.com" }
    password { 123456 }
    password_confirmation { 123456 }
  end
  factory :post do
    content{ This is  the factory bot post}
    user_id { 1 }
  end
end