require 'date'

FactoryBot.define do
  factory :punctuality do
    arrival_time { DateTime.now.to_s(:time) }
    departure_time { DateTime.now.to_s(:time) }
    date { DateTime.now.to_date }
    association :user
  end
end