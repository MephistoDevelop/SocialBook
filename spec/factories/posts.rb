# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    content { 'Hello test' }
    association :user
  end
end
