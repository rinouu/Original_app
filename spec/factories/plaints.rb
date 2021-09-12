require 'date'

FactoryBot.define do
  factory :plaint do
    title { 'Title 1' }
    description { 'undefined' }
    association :user
  end

  factory :second_plaint, class: Plaint do
    title { 'Title 2' }
    description { 'undefined' }
    association :user
  end
  factory :third_plaint, class: Plaint do
    title { 'Title 3' }
    description { 'undefined' }
    association :user
  end
end