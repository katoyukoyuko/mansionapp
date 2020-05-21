FactoryBot.define do
  factory :user do
    name { 'sample' }
    email { 'sample@example.com' }
    password { '000000' }
    role { 'chairman' }
  end
  # factory :user1, class: User do
  #   name { 'chairman' }
  #   email { 'chairman@example.com' }
  #   password { '000000' }
  #   role { 'chairman' }
  # end
  # factory :use2, class: User do
  #   name { 'apartment_manager' }
  #   email { 'apartment_manager@example.com' }
  #   password { '000000' }
  #   role { 'apartment_manager' }
  # end
end
