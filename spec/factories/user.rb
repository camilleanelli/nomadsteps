FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "johndoe@email.com"
    password "password"
    password_confirmation "password"
    confirmed_at 2.days.ago
  end
end
