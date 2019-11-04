FactoryBot.define do
    factory :post do
        content { 'Hello test'}
        association :user
    end
end