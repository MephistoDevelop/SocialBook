# frozen_string_literal: true

FactoryBot.define do
  factory :reaction do
    user_reaction { 'MyString' }
    association :post
    user { post.user }
  end
end
