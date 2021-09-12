FactoryBot.define do
  factory :category do
    name { "category 1" }
  end

  factory :category2, class: Category do
  	name { "category 2" }
  end
end
