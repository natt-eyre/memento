FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password "12345678"
    confirmed_at  (Time.now)
  end
end
