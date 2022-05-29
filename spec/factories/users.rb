FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'Pass123456' }
  end
end
