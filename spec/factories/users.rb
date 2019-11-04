FactoryBot.define do
    factory :user, aliases: [:author] do
        username {"Bato"}
        sequence(:email) { |n| "tester#{n}@example.com" }
        password {"dottle-nouveau-pavilion-tights-furze"}
    end
end