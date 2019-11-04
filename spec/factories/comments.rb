FactoryBot.define do
    factory :comment do
        content { 'Test comment'}
        association :author
        association :post
    end
end