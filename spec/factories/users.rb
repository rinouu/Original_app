FactoryBot.define do
  factory :user do
    name { "User 1" }
    email { "user@dive.l" }
    password { "123456" }
    #admin { false }
  end
  factory :user2, class: User do
    name { "User 2" }
    email { "user2@dive.l" }
    password { "123456" }
    #admin { false }
  end

  factory :user3, class: User do
    name { "User 3" }
    email { "user3@dive.l" }
    password { "123456" }
    #admin { false }
  end

  factory :user4, class: User do
    name { "User 4" }
    email { "user4@dive.l" }
    password { "123456" }
    #admin { false }
  end

  factory :admin, class: User do
    name { "User admin" }
    email { "admin2@dive.l" }
    password { "123456" }
    admin { true }
  end
end
