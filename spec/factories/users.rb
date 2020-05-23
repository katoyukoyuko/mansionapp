FactoryBot.define do
  factory :admin, class: User do
    name { 'sample' }
    email { 'sample@example.com' }
    password { '000000' }
    role { 'chairman' }
    confirmed_at { Time.now }
  end

  factory :user, class: User do
    name { 'apartment_manager' }
    email { 'apartment_manager@example.com' }
    password { '000000' }
    role { 'apartment_manager' }
    confirmed_at { Time.now }
  end

  factory :user2, class: User do
    name { 'user2' }
    email { 'user2@example.com' }
    password { '000000' }
    role { 'user' }
    confirmed_at { Time.now }
  end
end
