# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { FFaker::CheesyLingo.title }
    content { FFaker::BaconIpsum.paragraph }
    done { false }
    user
    finished_at { FFaker::Time.datetime }
  end
  factory :event_wrong, parent: :event do
    name { nil }
    user { nil }
  end
end
