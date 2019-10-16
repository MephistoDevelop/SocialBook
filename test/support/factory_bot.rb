# frozen_string_literal: true

require 'rails_helper'

FactoryBot.define do
  factory :user do
    username { 'John' }
    email { 'Doe' }
    password { 123_456 }
    password_confirmation { 123_456 }
  end

  factory :post do
    content { This is the factory bot post }
    user_id { 1 }
  end
end
