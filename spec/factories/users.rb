# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { FFaker::Internet.user_name[2...16] }
    sequence(:email) { |n| "person#{n}@example.com" }
    active { true }
    role { create(:role) }
    password { 'какой-то пароль' }

    after(:create) do |user|
      def user.admin?
        false
      end
    end
  end
end
